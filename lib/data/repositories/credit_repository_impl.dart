import 'package:financial_app/data/datasources/credit_local_data_source.dart';
import 'package:financial_app/domain/entities/credit.dart';
import 'package:financial_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:financial_app/domain/repositories/credit_repository.dart';

class CreditRepositoryImpl implements CreditRepository {
  final CreditLocalDataSource creditLocalDataSource;

  CreditRepositoryImpl({
    this.creditLocalDataSource
  });

  @override
  Future<Either<Failure, bool>> createCredit(Credit credit) async {
    try {
      await this.creditLocalDataSource.save(credit);
      return Right(true);
    } on Exception {
      return Left( CantCreateFailure() );
    }
  }

  @override
  Future<Either<Failure, bool>> deleteCredit(int id) async {
    try {
      await this.creditLocalDataSource.delete(id);
      return Right(true);
    } on Exception {
      return Left( NotFoundFailure() );
    }
  }

  @override
  Future<Either<Failure, bool>> editCredit(Credit credit) async {
    try {
      await this.creditLocalDataSource.edit(credit);
      return Right(true);
    } on Exception {
      return Left( NotFoundFailure() );
    }
  }

  @override
  Future<Either<Failure, List<Credit>>> getAllCredits() async {
    try {
      final credits = await this.creditLocalDataSource.query();
      return Right(credits);
    } on Exception {
      return Left( EmptyFailure() );
    }
  }

  @override
  Future<Either<Failure, Credit>> getCredit(int id) async {
    try {
      final credits = await this.creditLocalDataSource.query(id: id);
      return Right( credits.first );
    } on Exception {
      return Left( EmptyFailure() );
    }
  }

}