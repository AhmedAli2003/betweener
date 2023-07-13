import 'package:betweener/core/entities/user_entity.dart';

class RegisterEntity {
  final String message;
  final String token;
  final UserEntity user;
  final RegisterErrorEntity registerErrorEntity;

  const RegisterEntity({
    required this.message,
    required this.token,
    required this.user,
    required this.registerErrorEntity,
  });

  const RegisterEntity.empty({
    this.message = '',
    this.token = '',
    this.user = const UserEntity.empty(),
    this.registerErrorEntity = const RegisterErrorEntity.empty(),
  });


  @override
  String toString() {
    return 'RegisterEntity(message: $message, token: $token, user: $user, registerErrorEntity: $registerErrorEntity)';
  }
}

class RegisterErrorEntity {
  final List<String> emailErrors;
  final List<String> passwordErrors;

  const RegisterErrorEntity({
    required this.emailErrors,
    required this.passwordErrors,
  });

  const RegisterErrorEntity.empty({
    this.emailErrors = const [],
    this.passwordErrors = const [],
  });


  @override
  String toString() => 'RegisterErrorEntity(emailErrors: $emailErrors, passwordErrors: $passwordErrors)';
}
