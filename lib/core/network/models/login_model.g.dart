// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginSuccessModel _$LoginSuccessModelFromJson(Map<String, dynamic> json) =>
    LoginSuccessModel(
      userModel: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$LoginSuccessModelToJson(LoginSuccessModel instance) =>
    <String, dynamic>{
      'user': instance.userModel,
      'token': instance.token,
    };
