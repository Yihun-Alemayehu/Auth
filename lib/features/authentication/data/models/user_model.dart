import 'dart:convert';

import 'package:authentication_app/features/authentication/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.createdAt,
    required super.name,
    required super.avatar,
  });

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source) as Map<String, dynamic>);

  UserModel.fromMap(Map<String, dynamic> map)
      : this(
          id: map['id'] as String,
          createdAt: map['createdAt'] as String,
          name: map['name'] as String,
          avatar: map['avatar'] as String,
        );

  factory UserModel.fromsth(Map<String, dynamic> sth) {
    return UserModel(
        id: sth['id'],
        createdAt: sth['createdAt'],
        name: sth['name'],
        avatar: sth['avatar']);
  }

  const UserModel.empty()
      : this(
          id: '_empty.id',
          createdAt: '_empty.createdAt',
          name: '_empty.name',
          avatar: '_empty.avatar',
        );

  UserModel copyWith({
    String? id,
    String? name,
    String? avatar,
    String? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'avatar': avatar,
        'createdAt': createdAt,
      };

  String toJson() => jsonEncode(toMap());
}
