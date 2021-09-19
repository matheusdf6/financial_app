import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import 'package:financial_app/domain/entities/user.dart';
import '../../repositories/user_repository.dart';

class SaveUser extends UseCase<User, SaveUserParams> {
  final UserRepository userRepository;

  SaveUser(this.userRepository);

  @override
  Future<Either<Failure, User>> call(SaveUserParams params) async {
    return await this.userRepository.saveUser(
      firstName: params.firstName,
      lastName: params.lastName,
      email: params.email,
      imageUrl: params.imageUrl
    );
  }
}

class SaveUserParams {
  final String firstName;
  final String lastName;
  final String email;
  final String imageUrl;

  SaveUserParams({
    @required this.firstName,
    @required this.lastName,
    this.email,
    this.imageUrl
  });
}
