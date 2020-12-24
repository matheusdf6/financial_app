import 'package:dartz/dartz.dart';
import 'package:financial_app/domain/enums/debt_category_enum.dart';

import '../../core/errors/failures.dart';
import '../entities/summary.dart';
import '../entities/summary_list.dart';

abstract class SummaryRepository {
  Future<Either<Failure, Summary>> getMonthSummary(int year, int month);
  Future<Either<Failure, SummaryList>> getSemesterSummary();
  Future<Either<Failure, SummaryList>> getSemesterSummaryByCategory(DebtCategory category);
}