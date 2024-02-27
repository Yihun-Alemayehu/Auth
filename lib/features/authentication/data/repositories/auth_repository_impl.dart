import 'package:authentication_app/core/utils/typedef.dart';
import 'package:authentication_app/features/authentication/data/data_sources/auth_remote_data_sources.dart';
import 'package:authentication_app/features/authentication/domain/entities/user.dart';
import 'package:authentication_app/features/authentication/domain/repositories/auth_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource _remoteDataSource;

  AuthenticationRepositoryImpl(
      {required AuthenticationRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  ResultVoid createUser(
      {required String createdAt,
      required String name,
      required String avatar}) async{
    //  await _remoteDataSource.createUser(createdAt: createdAt, name: name, avatar: avatar);
  }

  @override
  ResultFuture<List<User>> getUsers() async{
    // TODO: implement getUsers
    throw UnimplementedError();
  }
}
