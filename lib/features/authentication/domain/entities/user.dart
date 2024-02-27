import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String createdAt;
  final String name;
  final String avatar;

  const User({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  const User.empty()
      : this(
          id: '_empty.id',
          createdAt: '_empty.createdAt',
          name: '_empty.name',
          avatar: '_empty.avatar',
        );

  @override
  List<Object?> get props => [id];
}
