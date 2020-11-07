import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../entities/credit.dart';

abstract class CreditRepository {
  Future<Either<Failure,List<Credit>>> getAllCredits();
  Future<Either<Failure,Credit>> getCredit(String id);
  Future<Either<Failure,bool>> createCredit(Credit credit);
  Future<Either<Failure,bool>> editCredit(Credit credit);
  Future<Either<Failure,bool>> deleteCredit(String id);
}