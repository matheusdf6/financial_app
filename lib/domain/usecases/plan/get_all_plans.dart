import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/plan.dart';
import '../../repositories/plan_repository.dart';

class GetAllPlans extends UseCase<List<Plan>, NoParams> {
  final PlanRepository planRepository;

  GetAllPlans(this.planRepository);

  @override
  Future<Either<Failure, List<Plan>>> call(NoParams params) async {
    return await this.planRepository.getAllPlans();
  }
}