import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/credit.dart';
import '../../repositories/credit_repository.dart';

class EditCredit extends UseCase<bool, EditCreditParams> {
  final CreditRepository creditRepository;

  EditCredit(this.creditRepository);

  @override
  Future<Either<Failure, bool>> call(EditCreditParams params) async {
    return await this.creditRepository.editCredit(params.credit);
  }
}

class EditCreditParams {
  final Credit credit;

  EditCreditParams({
    @required this.credit
  });
}