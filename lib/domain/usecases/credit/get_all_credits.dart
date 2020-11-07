import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/credit.dart';
import '../../repositories/credit_repository.dart';

class GetAllCredits extends UseCase<List<Credit>, NoParams> {
  final CreditRepository creditRepository;

  GetAllCredits(this.creditRepository);

  @override
  Future<Either<Failure, List<Credit>>> call(NoParams params) async {
    return await this.creditRepository.getAllCredits();
  }
}