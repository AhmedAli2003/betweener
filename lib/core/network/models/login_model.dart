import 'package:betweener/core/network/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@immutable
@JsonSerializable()
class LoginSuccessModel {
  @JsonKey(name: 'user')
  final UserModel? userModel;
  final String? token;

  const LoginSuccessModel({
    required this.userModel,
    required this.token,
  });

  factory LoginSuccessModel.fromJson(Map<String, dynamic> json) => _$LoginSuccessModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginSuccessModelToJson(this);
}
