import 'package:financial_app/data/datasources/credit_local_data_source.dart';
import 'package:financial_app/data/datasources/debt_local_data_source.dart';
import 'package:financial_app/domain/enums/debt_category_enum.dart';
import 'package:financial_app/domain/entities/summary_list.dart';
import 'package:financial_app/domain/entities/summary.dart';
import 'package:financial_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:financial_app/domain/repositories/summary_repository.dart';

class SummaryRepositoryImpl implements SummaryRepository {
  final CreditLocalDataSource creditLocalDataSource;
  final DebtLocalDataSource debtLocalDataSource;

  SummaryRepositoryImpl({
    this.creditLocalDataSource,
    this.debtLocalDataSource
  });

  Future<Summary> _getMonthSummary(int year, int month) async {
      final credits = await this.creditLocalDataSource.queryByMonth(year, month);
      final debts = await this.debtLocalDataSource.queryByMonth(year, month);
      return Summary(
        ammountCredits: credits.fold(0, (previousValue, credit) => previousValue + credit.amount),
        ammountDebts: debts.fold(0, (previousValue, debt) => previousValue + debt.amount),
        month: month,
        year: year
      );
  }

  @override
  Future<Either<Failure, Summary>> getMonthSummary(int year, int month) async {
    try {
      return Right( await this._getMonthSummary(year, month) );
    } on Exception {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, SummaryList>> getSemesterSummary() async {
    try {
      final today = DateTime.now();
      final semesterDates = [ 0, 1, 2, 3, 4, 5 ]
                              .map((e) => DateTime(today.year, today.month - e, today.day));
      final summaries = await Future.wait( semesterDates.map((e) async {
        final summary = await this._getMonthSummary(e.year, e.month);
        return summary;
      }));
      final summaryList = SummaryList();
      summaryList.addAll(summaries);
      return Right( summaryList );
    } on Exception {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, SummaryList>> getSemesterSummaryByCategory(DebtCategory category) {
    // TODO: implement getSemesterSummaryByCategory
    throw UnimplementedError();
  }



}