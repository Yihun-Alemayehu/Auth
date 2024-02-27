
import 'package:authentication_app/core/usecase/usecase.dart';
import 'package:authentication_app/core/utils/typedef.dart';
import 'package:authentication_app/features/authentication/domain/entities/user.dart';
import 'package:authentication_app/features/authentication/domain/repositories/auth_repository.dart';

class GetUsersUsecase extends UsecaseWithOutParams<Type> {
  final AuthenticationRepository _repository;

  GetUsersUsecase({required AuthenticationRepository repository}) : _repository = repository;
  
  @override
  ResultFuture<List<User>> call() async => _repository.getUsers();

}