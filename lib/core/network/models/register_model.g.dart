// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
      message: json['message'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
    };

RegisterSuccessModel _$RegisterSuccessModelFromJson(
        Map<String, dynamic> json) =>
    RegisterSuccessModel(
      message: json['message'] as String?,
      token: json['token'] as String?,
      userModel: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterSuccessModelToJson(
        RegisterSuccessModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'user': instance.userModel,
    };

RegisterFailureModel _$RegisterFailureModelFromJson(
        Map<String, dynamic> json) =>
    RegisterFailureModel(
      message: json['message'] as String?,
      token: json['token'] as String?,
      registerErrorModel: json['errors'] == null
          ? null
          : RegisterErrorModel.fromJson(json['errors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterFailureModelToJson(
        RegisterFailureModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'errors': instance.registerErrorModel,
    };

RegisterErrorModel _$RegisterErrorModelFromJson(Map<String, dynamic> json) =>
    RegisterErrorModel(
      emailErrors: (json['emailErrors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      passwordErrors: (json['passwordErrors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RegisterErrorModelToJson(RegisterErrorModel instance) =>
    <String, dynamic>{
      'emailErrors': instance.emailErrors,
      'passwordErrors': instance.passwordErrors,
    };
