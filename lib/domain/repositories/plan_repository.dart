import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../entities/plan.dart';

abstract class PlanRepository {
  Future<Either<Failure,List<Plan>>> getAllPlans();
  Future<Either<Failure,Plan>> getPlan(String id);
  Future<Either<Failure,bool>> createPlan(Plan plan);
  Future<Either<Failure,bool>> editPlan(Plan plan);
  Future<Either<Failure,bool>> deletePlan(String id);
}