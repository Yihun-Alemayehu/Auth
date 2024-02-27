import 'package:authentication_app/features/authentication/domain/entities/user.dart';
import 'package:authentication_app/features/authentication/domain/usecases/create_user_usecase.dart';
import 'package:authentication_app/features/authentication/domain/usecases/get_users_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CreateUserUsecase _createUser;
  final GetUsersUsecase _getUsers;

  AuthBloc({
    required CreateUserUsecase createUser,
    required GetUsersUsecase getUsers,
  })  : _createUser = createUser,
        _getUsers = getUsers,
        super(AuthInitial()) {
    on<CreateUserEvent>(_createUserHandler);
    on<GetUsersEvent>(_getUsersHandler);
  }

  Future<void> _createUserHandler(
    CreateUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(CreateUserLoadingState());
    final result = await _createUser.call(Params(
        createdAt: event.createdAt, name: event.name, avatar: event.avatar));

    result.fold(
        (failure) => emit(AuthErrorState(
            errorMessage: '${failure.statusCode} Error: ${failure.message}')),
        (_) => emit(CreateUserState()));
  }

  Future<void> _getUsersHandler(
    GetUsersEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(GetUsersLoadingState());
    final result = await _getUsers.call();

    result.fold(
        (failure) => emit(AuthErrorState(
            errorMessage: '${failure.statusCode} Error: ${failure.message}')),
        (users) => emit(GetUsersState(users: users)));
  }
}
