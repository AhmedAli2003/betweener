import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class UserEntity {
  final int id;
  final String name;
  final String email;
  final String emailVerifiedAt;
  final String creationDate;
  final String lastUpdateDate;
  final int isActive;
  final String country;
  final String ip;
  final double long;
  final double lat;
  final String fcm;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.creationDate,
    required this.lastUpdateDate,
    required this.isActive,
    required this.country,
    required this.ip,
    required this.long,
    required this.lat,
    required this.fcm,
  });

  const UserEntity.empty({
    this.id = 0,
    this.name = '',
    this.email = '',
    this.emailVerifiedAt = '',
    this.creationDate = '',
    this.lastUpdateDate = '',
    this.isActive = 0,
    this.country = '',
    this.ip = '',
    this.long = 0,
    this.lat = 0,
    this.fcm = '',
  });

  @override
  String toString() {
    return 'UserEntity(id: $id, name: $name, email: $email, emailVerifiedAt: $emailVerifiedAt, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, isActive: $isActive, country: $country, ip: $ip, long: $long, lat: $lat, fcm: $fcm)';
  }
}

class UserEntityNotifier extends StateNotifier<UserEntity> {
  UserEntityNotifier(super.state);

  void update(UserEntity userEntity) {
    state = userEntity;
  }
}
