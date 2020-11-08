import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/summary_list.dart';
import '../../repositories/summary_repository.dart';

class GetSemesterSummary extends UseCase<SummaryList, NoParams > {
  final SummaryRepository summaryRepository;

  GetSemesterSummary(this.summaryRepository);
  
  @override
  Future<Either<Failure, SummaryList>> call(NoParams params) async {
    return await this.summaryRepository.getSemesterSummary();
  }
} 