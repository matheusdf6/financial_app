import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';


import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import 'package:financial_app/domain/entities/user.dart';
import '../../repositories/user_repository.dart';

class GetUser extends UseCase<User, NoParams > {
  final UserRepository userRepository;

  GetUser(this.userRepository);
  
  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await this.userRepository.getUser();
  }
} 