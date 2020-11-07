import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/credit.dart';
import '../../repositories/credit_repository.dart';

class CreateCredit extends UseCase<bool, CreateCreditParams> {
  final CreditRepository creditRepository;

  CreateCredit(this.creditRepository);

  @override
  Future<Either<Failure, bool>> call(CreateCreditParams params) async {
    return await this.creditRepository.createCredit(params.credit);
  }
}

class CreateCreditParams {
  final Credit credit;

  CreateCreditParams({
    @required this.credit
  });
}

