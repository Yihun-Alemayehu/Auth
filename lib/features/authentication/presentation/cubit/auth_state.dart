part of 'auth_cubit.dart';


abstract class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class CreateUserLoadingState extends AuthState{}

class GetUsersLoadingState extends AuthState{}

class CreateUserState extends AuthState{}

class GetUsersState extends AuthState{
  final List<User> users;

  const GetUsersState({required this.users});

  @override
  List<String> get props => users.map((user) => user.id).toList();
}

class AuthErrorState extends AuthState {
  final String errorMessage;

  const AuthErrorState({required this.errorMessage});

  // we can manipulate the type of the list [List<Object>] 
  // based on our parameters that we receive through a constructor
  @override
  List<String> get props => [errorMessage];
}

