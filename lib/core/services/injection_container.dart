import 'package:authentication_app/features/authentication/data/data_sources/auth_remote_data_sources.dart';
import 'package:authentication_app/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:authentication_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:authentication_app/features/authentication/domain/usecases/create_user_usecase.dart';
import 'package:authentication_app/features/authentication/domain/usecases/get_users_usecase.dart';
import 'package:authentication_app/features/authentication/presentation/auth-bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart'as http;

final sl = GetIt.instance;

Future<void> init() async {
  // Logics
  sl.registerFactory(() => AuthBloc(createUser: sl(), getUsers: sl()));

  // Usecases
  sl.registerLazySingleton(() => CreateUserUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetUsersUsecase(repository: sl()));

  // Repositories
  sl.registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepositoryImpl(remoteDataSource: sl()));

  // DataSources
  sl.registerLazySingleton<AuthenticationRemoteDataSource>(() => AuthenticationRemoteDataSourceImpl(client: sl()));

  // External dependencies
  sl.registerLazySingleton(() => http.Client()); 
} 