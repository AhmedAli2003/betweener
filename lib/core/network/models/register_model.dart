import 'package:betweener/core/network/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@immutable
@JsonSerializable()
class RegisterModel {
  final String? message;
  final String? token;

  const RegisterModel({
    required this.message,
    required this.token,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => _$RegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}

@immutable
@JsonSerializable()
class RegisterSuccessModel extends RegisterModel {
  @JsonKey(name: 'user')
  final UserModel? userModel;

  const RegisterSuccessModel({
    required super.message,
    required super.token,
    required this.userModel,
  });

  factory RegisterSuccessModel.fromJson(Map<String, dynamic> json) => _$RegisterSuccessModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RegisterSuccessModelToJson(this);
}

@immutable
@JsonSerializable()
class RegisterFailureModel extends RegisterModel {
  @JsonKey(name: 'errors')
  final RegisterErrorModel? registerErrorModel;
  const RegisterFailureModel({
    required super.message,
    required super.token,
    required this.registerErrorModel,
  });

    factory RegisterFailureModel.fromJson(Map<String, dynamic> json) => _$RegisterFailureModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RegisterFailureModelToJson(this);
}

@immutable
@JsonSerializable()
class RegisterErrorModel {
  final List<String>? emailErrors;
  final List<String>? passwordErrors;

  const RegisterErrorModel({
    required this.emailErrors,
    required this.passwordErrors,
  });

  factory RegisterErrorModel.fromJson(Map<String, dynamic> json) => _$RegisterErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterErrorModelToJson(this);
}
