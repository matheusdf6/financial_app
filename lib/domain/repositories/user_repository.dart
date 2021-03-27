import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure,User>> getUser();
  Future<Either<Failure,User>> saveUser({ String firstName, String lastName, String email, String imageUrl });
}