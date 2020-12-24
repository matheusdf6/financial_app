import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/entry.dart';
import '../../repositories/debt_repository.dart';

class GetDebt extends UseCase<Entry, GetDebtParams> {
  final DebtRepository debtRepository;

  GetDebt(this.debtRepository);

  @override
  Future<Either<Failure, Entry>> call(GetDebtParams params) async {
    return await this.debtRepository.getDebt(params.id);
  }
}

class GetDebtParams {
  final int id;

  GetDebtParams({
    @required this.id
  });
}