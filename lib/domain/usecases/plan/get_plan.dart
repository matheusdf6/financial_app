import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/plan.dart';
import '../../repositories/plan_repository.dart';

class GetPlan extends UseCase<Plan, GetPlanParams> {
  final PlanRepository planRepository;

  GetPlan(this.planRepository);

  @override
  Future<Either<Failure, Plan>> call(GetPlanParams params) async {
    return await this.planRepository.getPlan(params.id);
  }
}

class GetPlanParams {
  final int id;

  GetPlanParams({
    @required this.id
  });
}