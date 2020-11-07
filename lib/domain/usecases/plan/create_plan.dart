import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/plan.dart';
import '../../repositories/plan_repository.dart';

class CreatePlan extends UseCase<bool, CreatePlanParams> {
  final PlanRepository planRepository;

  CreatePlan(this.planRepository);

  @override
  Future<Either<Failure, bool>> call(CreatePlanParams params) async {
    return await this.planRepository.createPlan(params.plan);
  }
}

class CreatePlanParams {
  final Plan plan;

  CreatePlanParams({
    @required this.plan
  });
}