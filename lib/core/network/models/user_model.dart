import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@immutable
@JsonSerializable()
class UserModel {
  final int? id;
  final String? name;
  final String? email;
  @JsonKey(name: 'email_verified_at')
  final String? emailVerifiedAt;
  @JsonKey(name: 'created_at')
  final String? creationDate;
  @JsonKey(name: 'updated_at')
  final String? lastUpdateDate;
  final int? isActive;
  final String? country;
  final String? ip;
  final double? long;
  final double? lat;
  final String? fcm;
  const UserModel({
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

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, emailVerifiedAt: $emailVerifiedAt, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, isActive: $isActive, country: $country, ip: $ip, long: $long, lat: $lat, fcm: $fcm)';
  }
}
