import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../entities/summary.dart';
import '../entities/summary_list.dart';

abstract class SummaryRepository {
  Future<Either<Failure, Summary>> getMonthSummary();
  Future<Either<Failure, SummaryList>> getSemesterSummary();
}