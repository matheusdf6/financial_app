import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../repositories/plan_repository.dart';

class DeletePlan extends UseCase<bool, DeletePlanParams> {
  final PlanRepository planRepository;

  DeletePlan(this.planRepository);

  @override
  Future<Either<Failure, bool>> call(DeletePlanParams params) async {
    return await this.planRepository.deletePlan(params.id);
  }
}

class DeletePlanParams {
  final String id;

  DeletePlanParams({
    @required this.id
  });
}
