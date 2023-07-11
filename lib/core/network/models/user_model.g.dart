// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String?,
      creationDate: json['created_at'] as String?,
      lastUpdateDate: json['updated_at'] as String?,
      isActive: json['isActive'] as int?,
      country: json['country'] as String?,
      ip: json['ip'] as String?,
      long: (json['long'] as num?)?.toDouble(),
      lat: (json['lat'] as num?)?.toDouble(),
      fcm: json['fcm'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
      'created_at': instance.creationDate,
      'updated_at': instance.lastUpdateDate,
      'isActive': instance.isActive,
      'country': instance.country,
      'ip': instance.ip,
      'long': instance.long,
      'lat': instance.lat,
      'fcm': instance.fcm,
    };
