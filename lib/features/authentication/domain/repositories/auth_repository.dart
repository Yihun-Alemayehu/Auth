import 'package:authentication_app/core/utils/typedef.dart';
import 'package:authentication_app/features/authentication/domain/entities/user.dart';

abstract class AuthenticationRepository {
  
  ResultVoid createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });

  ResultFuture<List<User>> getUsers();
}
