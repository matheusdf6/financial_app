import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/summary.dart';
import '../../repositories/summary_repository.dart';

class GetMonthSummary extends UseCase<Summary, GetMonthSummaryParams > {
  final SummaryRepository summaryRepository;

  GetMonthSummary(this.summaryRepository);
  
  @override
  Future<Either<Failure, Summary>> call(GetMonthSummaryParams params) async {
    return await this.summaryRepository.getMonthSummary(params.year, params.month);
  }
} 

class GetMonthSummaryParams {
  final int year;
  final int month;

  GetMonthSummaryParams({
    @required this.year,
    @required this.month
  });
}