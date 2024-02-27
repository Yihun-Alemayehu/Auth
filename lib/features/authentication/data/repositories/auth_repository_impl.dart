import 'package:authentication_app/core/utils/typedef.dart';
import 'package:authentication_app/features/authentication/domain/entities/user.dart';
import 'package:authentication_app/features/authentication/domain/repositories/auth_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  @override
  ResultVoid createUser({required String createdAt, required String name, required String avatar}) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  ResultFuture<List<User>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

}