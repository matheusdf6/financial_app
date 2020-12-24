import 'package:dartz/dartz.dart';
import 'package:financial_app/data/datasources/plan_local_data_source.dart';
import 'package:financial_app/domain/repositories/plan_repository.dart';

import '../../core/errors/failures.dart';
import '../../domain/entities/plan.dart';

class PlanRepositoryImpl implements PlanRepository {
  final PlanLocalDataSource planLocalDataSource;

  PlanRepositoryImpl({
    this.planLocalDataSource
  });

  @override
  Future<Either<Failure, bool>> createPlan(Plan plan) async {
    try {
      await this.planLocalDataSource.save(plan);
      return Right(true);
    } on Exception {
      return Left( CantCreateFailure() );
    }
  }

  @override
  Future<Either<Failure, bool>> deletePlan(int id) async {
    try {
      await this.planLocalDataSource.delete(id);
      return Right(true);
    } on Exception {
      return Left( NotFoundFailure() );
    }
  }

  @override
  Future<Either<Failure, bool>> editPlan(Plan plan) async {
    try {
      await this.planLocalDataSource.edit(plan);
      return Right(true);
    } on Exception {
      return Left( NotFoundFailure() );
    }
  }

  @override
  Future<Either<Failure, List<Plan>>> getAllPlans() async {
    try {
      final plans = await this.planLocalDataSource.query();
      return Right(plans);
    } on Exception {
      return Left( EmptyFailure() );
    }
  }

  @override
  Future<Either<Failure, Plan>> getPlan(int id) async {
    try {
      final plans = await this.planLocalDataSource.query(id);
      return Right( plans.first );
    } on Exception {
      return Left( EmptyFailure() );
    }
  }

}