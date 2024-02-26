import 'package:authentication_app/core/utils/typedef.dart';
import 'package:authentication_app/features/authentication/domain/repositories/auth_repository.dart';

class CreateUserUsecase {
  final AuthenticationRepository _repository;

  CreateUserUsecase({required AuthenticationRepository repository})
      : _repository = repository;

  ResultVoid createUser({
    required String createdAt,
    required String name,
    required String avatar,
  }) async =>
      await _repository.createUser(
          createdAt: createdAt, name: name, avatar: avatar);
}
