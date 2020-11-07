import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../repositories/credit_repository.dart';

class DeleteCredit extends UseCase<bool, DeleteCreditParams> {
  final CreditRepository creditRepository;

  DeleteCredit(this.creditRepository);

  @override
  Future<Either<Failure, bool>> call(DeleteCreditParams params) async {
    return await this.creditRepository.deleteCredit(params.id);
  }
}

class DeleteCreditParams {
  final String id;

  DeleteCreditParams({
    @required this.id
  });
}
