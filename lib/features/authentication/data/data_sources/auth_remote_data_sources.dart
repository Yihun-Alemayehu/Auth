import 'dart:convert';

import 'package:authentication_app/core/errors/failure.dart';
import 'package:authentication_app/core/utils/constant.dart';
import 'package:authentication_app/features/authentication/data/models/user_model.dart';
import 'package:http/http.dart' as http;

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

  AuthenticationRemoteDataSourceImpl({required http.Client client})
      : _client = client;

  @override
  Future<void> createUser(
      {required String createdAt,
      required String name,
      required String avatar}) async {
    try {
      final response = await _client.post(
        Uri.parse('$kBaseUrl/users'),
        body: jsonEncode(
          {
            'createdAt': createdAt,
            'name': name,
            'avatar': avatar,
          },
        ),
      );
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw ApiFailure(
            message: response.body, statusCode: response.statusCode);
      }
    } on ApiFailure {
      rethrow;
    } catch (e) {
      throw ApiFailure(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final response = await _client.get(Uri.parse('$kBaseUrl/users'));
      final responseResult =
          List<Map<String, dynamic>>.from(jsonDecode(response.body))
              .map((userData) => UserModel.fromMap(userData))
              .toList();
      if (response.statusCode != 200) {
        throw ApiFailure(
            message: response.body, statusCode: response.statusCode);
      }
      return responseResult;
    } on ApiFailure {
      rethrow;
    } catch (e) {
      throw ApiFailure(message: e.toString(), statusCode: 505);
    }
  }
}
