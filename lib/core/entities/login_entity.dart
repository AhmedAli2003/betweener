import 'package:betweener/core/entities/user_entity.dart';

class LoginEntity {
  final UserEntity user;
  final String token;

  const LoginEntity({
    required this.user,
    required this.token,
  });

  const LoginEntity.empty({
    this.user = const UserEntity.empty(),
    this.token = '',
  });

  @override
  String toString() => 'LoginEntity(user: $user, token: $token)';
}
