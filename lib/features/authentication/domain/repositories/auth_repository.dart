import 'package:authentication_app/features/authentication/domain/entities/user.dart';

abstract class AuthenticationRepository {
  
  Future<void> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });

  Future<List<User>> getUsers();
}
