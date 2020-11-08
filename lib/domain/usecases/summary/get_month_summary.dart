import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/summary.dart';
import '../../repositories/summary_repository.dart';

class GetMonthSummary extends UseCase<Summary, NoParams > {
  final SummaryRepository summaryRepository;

  GetMonthSummary(this.summaryRepository);
  
  @override
  Future<Either<Failure, Summary>> call(NoParams params) async {
    return await this.summaryRepository.getMonthSummary();
  }
} 