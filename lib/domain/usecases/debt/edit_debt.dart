import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/debt.dart';
import '../../repositories/debt_repository.dart';

class EditDebt extends UseCase<bool, EditDebtParams> {
  final DebtRepository debtRepository;

  EditDebt(this.debtRepository);

  @override
  Future<Either<Failure, bool>> call(EditDebtParams params) async {
    return await this.debtRepository.editDebt(params.debt);
  }
}

class EditDebtParams {
  final Debt debt;

  EditDebtParams({
    @required this.debt
  });
}