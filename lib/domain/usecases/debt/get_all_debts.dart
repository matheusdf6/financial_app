import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/debt.dart';
import '../../repositories/debt_repository.dart';

class GetAllDebts extends UseCase<List<Debt>, NoParams> {
  final DebtRepository debtRepository;

  GetAllDebts(this.debtRepository);

  @override
  Future<Either<Failure, List<Debt>>> call(NoParams params) async {
    return await this.debtRepository.getAllDebts();
  }
}