import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../../domain/entities/debt.dart';
import '../../domain/repositories/debt_repository.dart';
import '../datasources/debt_local_data_source.dart';

class DebtRepositoryImpl implements DebtRepository {
  final DebtLocalDataSource debtLocalDataSource;

  DebtRepositoryImpl({
    this.debtLocalDataSource
  });

  @override
  Future<Either<Failure, bool>> createDebt(Debt debt) async {
    try {
      await this.debtLocalDataSource.save(debt);
      return Right(true);
    } on Exception {
      return Left( CantCreateFailure() );
    }
  }

  @override
  Future<Either<Failure, bool>> deleteDebt(int id) async {
    try {
      await this.debtLocalDataSource.delete(id);
      return Right(true);
    } on Exception {
      return Left( NotFoundFailure() );
    }
  }

  @override
  Future<Either<Failure, bool>> editDebt(Debt debt) async {
    try {
      await this.debtLocalDataSource.edit(debt);
      return Right(true);
    } on Exception {
      return Left( NotFoundFailure() );
    }
  }

  @override
  Future<Either<Failure, List<Debt>>> getAllDebts() async {
    try {
      final debts = await this.debtLocalDataSource.queryAll();
      return Right(debts);
    } on Exception {
      return Left( EmptyFailure() );
    }
  }

  @override
  Future<Either<Failure, Debt>> getDebt(int id) async {
    try {
      final debts = await this.debtLocalDataSource.queryById(id);
      return Right( debts.first );
    } on Exception {
      return Left( EmptyFailure() );
    }
  }

}