import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/credit.dart';
import '../../repositories/credit_repository.dart';

class GetCredit extends UseCase<Credit, GetCreditParams> {
  final CreditRepository creditRepository;

  GetCredit(this.creditRepository);

  @override
  Future<Either<Failure, Credit>> call(GetCreditParams params) async {
    return await this.creditRepository.getCredit(params.id);
  }
}

class GetCreditParams {
  final String id;

  GetCreditParams({
    @required this.id
  });
}