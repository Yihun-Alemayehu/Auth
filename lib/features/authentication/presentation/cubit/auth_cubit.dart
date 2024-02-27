import 'package:authentication_app/features/authentication/domain/entities/user.dart';
import 'package:authentication_app/features/authentication/domain/usecases/create_user_usecase.dart';
import 'package:authentication_app/features/authentication/domain/usecases/get_users_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final CreateUserUsecase _createUser;
  final GetUsersUsecase _getUsers;
  AuthCubit({
    required CreateUserUsecase createUser,
    required GetUsersUsecase getUsers,
  })  : _createUser = createUser,
        _getUsers = getUsers,
        super(AuthInitial());

  Future<void> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  }) async {
    final result = await _createUser
        .call(Params(createdAt: createdAt, name: name, avatar: avatar));

    result.fold(
        (failure) => emit(AuthErrorState(
            errorMessage: '${failure.statusCode} Error: ${failure.message}')),
        (_) => emit(CreateUserState()));
  }

  Future<void> getUsers() async {
    final result = await _getUsers.call();

    result.fold(
        (failure) => emit(AuthErrorState(
            errorMessage: '${failure.statusCode} Error: ${failure.message}')),
        (users) => emit(GetUsersState(users: users)));
  }
}
