import 'package:flutter/foundation.dart';

@immutable
class UserData {
  final String username;
  final String email;
  final String phone;

  const UserData({
    required this.username,
    required this.email,
    required this.phone,
  });

  @override
  String toString() => 'UserData(username: $username, email: $email, phone: $phone)';

  @override
  bool operator ==(covariant UserData other) {
    if (identical(this, other)) return true;

    return other.username == username && other.email == email && other.phone == phone;
  }

  @override
  int get hashCode => Object.hash(username, email, phone);
}
