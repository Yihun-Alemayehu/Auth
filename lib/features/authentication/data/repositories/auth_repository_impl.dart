import 'package:authentication_app/core/errors/failure.dart';
import 'package:authentication_app/core/utils/typedef.dart';
import 'package:authentication_app/features/authentication/data/data_sources/auth_remote_data_sources.dart';
import 'package:authentication_app/features/authentication/domain/entities/user.dart';
import 'package:authentication_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource _remoteDataSource;

  AuthenticationRepositoryImpl(
      {required AuthenticationRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  ResultVoid createUser(
      {required String createdAt,
      required String name,
      required String avatar}) async {
    try {
      await _remoteDataSource.createUser(
          createdAt: createdAt, name: name, avatar: avatar);
      return const Right(null);
    } on ApiFailure catch (e) {
      return Left(ApiFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<List<User>> getUsers() async {
    try {
      final result = await _remoteDataSource.getUsers();
    return Right(result);
    } on ApiFailure catch (e) {
      return Left(ApiFailure(message: e.message, statusCode: e.statusCode));
    } 
  }
  
}
