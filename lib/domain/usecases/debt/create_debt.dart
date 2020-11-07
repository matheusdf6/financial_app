import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/debt.dart';
import '../../repositories/debt_repository.dart';

class CreateDebt extends UseCase<bool, CreateDebtParams> {
  final DebtRepository debtRepository;

  CreateDebt(this.debtRepository);

  @override
  Future<Either<Failure, bool>> call(CreateDebtParams params) async {
    return await this.debtRepository.createDebt(params.debt);
  }
}

class CreateDebtParams {
  final Debt debt;

  CreateDebtParams({
    @required this.debt
  });
}