import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../entities/debt.dart';

abstract class DebtRepository {
  Future<Either<Failure,List<Debt>>> getAllDebts();
  Future<Either<Failure,Debt>> getDebt(String id);
  Future<Either<Failure,bool>> createDebt(Debt debt);
  Future<Either<Failure,bool>> editDebt(Debt debt);
  Future<Either<Failure,bool>> deleteDebt(String id);
}