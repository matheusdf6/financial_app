import 'package:dartz/dartz.dart';
import 'package:financial_app/domain/enums/debt_category_enum.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/summary_list.dart';
import '../../repositories/summary_repository.dart';

class GetCategorySemesterSummary extends UseCase<SummaryList, GetCategorySemesterSummaryParams > {
  final SummaryRepository summaryRepository;

  GetCategorySemesterSummary(this.summaryRepository);
  
  @override
  Future<Either<Failure, SummaryList>> call(GetCategorySemesterSummaryParams params) async {
    return await this.summaryRepository.getSemesterSummaryByCategory(params.category);
  }
} 

class GetCategorySemesterSummaryParams {
  final DebtCategory category;

  GetCategorySemesterSummaryParams({
    this.category
  });
}