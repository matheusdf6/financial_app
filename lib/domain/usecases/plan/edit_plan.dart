import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/plan.dart';
import '../../repositories/plan_repository.dart';

class EditPlan extends UseCase<bool, EditPlanParams> {
  final PlanRepository planRepository;

  EditPlan(this.planRepository);

  @override
  Future<Either<Failure, bool>> call(EditPlanParams params) async {
    return await this.planRepository.editPlan(params.plan);
  }
}

class EditPlanParams {
  final Plan plan;

  EditPlanParams({
    @required this.plan
  });
}