import 'package:flutter/foundation.dart';

@immutable
class LoginParm {
  final String email;
  final String password;

  const LoginParm({
    required this.email,
    required this.password,
  });
}
