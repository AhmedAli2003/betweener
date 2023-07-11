import 'package:betweener/core/network/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class RegisterModel {
  final String? message;
  final String? token;
  final UserModel? userModel;
  @JsonKey(name: 'errors')
  final RegisterErrorModel? registerErrorModel;

  const RegisterModel({
    required this.message,
    required this.token,
    required this.userModel,
    required this.registerErrorModel,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => _$RegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}

@immutable
@JsonSerializable()
class RegisterErrorModel {
  @JsonKey(name: 'email')
  final List<String>? emailErrors;
  @JsonKey(name: 'password')
  final List<String>? passwordErrors;

  const RegisterErrorModel({
    required this.emailErrors,
    required this.passwordErrors,
  });

  factory RegisterErrorModel.fromJson(Map<String, dynamic> json) => _$RegisterErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterErrorModelToJson(this);
}
