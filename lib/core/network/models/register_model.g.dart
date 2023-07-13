// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
      message: json['message'] as String?,
      token: json['token'] as String?,
      userModel: json['userModel'] == null
          ? null
          : UserModel.fromJson(json['userModel'] as Map<String, dynamic>),
      registerErrorModel: json['errors'] == null
          ? null
          : RegisterErrorModel.fromJson(json['errors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'userModel': instance.userModel?.toJson(),
      'errors': instance.registerErrorModel?.toJson(),
    };

RegisterErrorModel _$RegisterErrorModelFromJson(Map<String, dynamic> json) =>
    RegisterErrorModel(
      emailErrors:
          (json['email'] as List<dynamic>?)?.map((e) => e as String).toList(),
      passwordErrors: (json['password'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RegisterErrorModelToJson(RegisterErrorModel instance) =>
    <String, dynamic>{
      'email': instance.emailErrors,
      'password': instance.passwordErrors,
    };
