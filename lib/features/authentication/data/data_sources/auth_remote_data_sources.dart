import 'package:authentication_app/features/authentication/data/models/user_model.dart';

abstract class AuthenticationRemoteDataSource {

  Future<void> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });

  Future<List<UserModel>> getUsers();
}


class AuthenticationRemoteDataSourceImpl implements AuthenticationRemoteDataSource {

  @override
  Future<void> createUser({required String createdAt, required String name, required String avatar}) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

} 
