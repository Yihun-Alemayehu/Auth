import 'package:authentication_app/core/utils/constant.dart';
import 'package:authentication_app/features/authentication/data/models/user_model.dart';
import 'package:http/http.dart'as http;

// final http = Client();

abstract class AuthenticationRemoteDataSource {
  Future<void> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });

  Future<List<UserModel>> getUsers();
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  
  final http.Client _client;

  AuthenticationRemoteDataSourceImpl({required http.Client client}) : _client = client;

  @override
  Future<void> createUser(
      {required String createdAt,
      required String name,
      required String avatar}) async {
    final response = await _client.post(Uri.parse('$kBaseUrl/users'));
  }

  @override
  Future<List<UserModel>> getUsers() async {
    // TODO: implement getUsers
    throw UnimplementedError();
  }
}
