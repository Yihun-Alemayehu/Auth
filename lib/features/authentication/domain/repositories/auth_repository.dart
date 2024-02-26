import 'package:authentication_app/core/errors/failure.dart';
import 'package:authentication_app/features/authentication/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthenticationRepository {
  
  Future<Either<Failure,void>> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });

  Future<Either<Failure,List<User>>> getUsers();
}
