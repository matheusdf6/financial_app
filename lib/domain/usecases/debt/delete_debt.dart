import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../repositories/debt_repository.dart';

class DeleteDebt extends UseCase<bool, DeleteDebtParams> {
  final DebtRepository debtRepository;

  DeleteDebt(this.debtRepository);

  @override
  Future<Either<Failure, bool>> call(DeleteDebtParams params) async {
    return await this.debtRepository.deleteDebt(params.id);
  }
}

class DeleteDebtParams {
  final String id;

  DeleteDebtParams({
    @required this.id
  });
}