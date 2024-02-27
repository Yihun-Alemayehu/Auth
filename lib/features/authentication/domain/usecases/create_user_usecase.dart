import 'package:authentication_app/core/usecase/usecase.dart';
import 'package:authentication_app/core/utils/typedef.dart';
import 'package:authentication_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class CreateUserUsecase extends UsecaseWithParams<void, Params> {
  final AuthenticationRepository _repository;

  CreateUserUsecase({required AuthenticationRepository repository})
      : _repository = repository;

  // ResultVoid createUser({
  //   required String createdAt,
  //   required String name,
  //   required String avatar,
  // }) async =>
  //     await _repository.createUser(
  //         createdAt: createdAt, name: name, avatar: avatar);

  @override
  ResultVoid call(Params params) async => _repository.createUser(
        createdAt: params.createdAt,
        name: params.name,
        avatar: params.avatar,
      );
}

class Params extends Equatable {
  final String createdAt;
  final String name;
  final String avatar;

  const Params({
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  @override
  List<Object?> get props => [createdAt, name, avatar];
}
