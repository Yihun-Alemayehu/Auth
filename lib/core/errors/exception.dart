import 'package:equatable/equatable.dart';

class ServerExceptions extends Equatable implements Exception {
  final String message;
  final int statusCode;

  const ServerExceptions({
    required this.message,
    required this.statusCode,
  });


  @override
  List<Object?> get props => [message,statusCode];
}
