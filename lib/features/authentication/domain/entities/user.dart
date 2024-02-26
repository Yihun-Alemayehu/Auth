import 'package:equatable/equatable.dart';

class User extends Equatable{
  final int id;
  final String createdAt;
  final String name;
  final String avatar;

  User({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.avatar,
  });
  
  @override
  List<Object?> get props => [id];
}
