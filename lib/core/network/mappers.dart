import 'package:betweener/core/entities/linkes_entity.dart';
import 'package:betweener/core/entities/login_entity.dart';
import 'package:betweener/core/entities/long_lat_entity.dart';
import 'package:betweener/core/entities/register_entity.dart';
import 'package:betweener/core/entities/user_entity.dart';
import 'package:betweener/core/network/models/links_model.dart';
import 'package:betweener/core/network/models/login_model.dart';
import 'package:betweener/core/network/models/long_lat_model.dart';
import 'package:betweener/core/network/models/register_model.dart';
import 'package:betweener/core/network/models/user_model.dart';

extension ToLoginEntity on LoginSuccessModel? {
  LoginEntity toEntity() {
    return LoginEntity(
      user: this?.userModel.toEntity() ?? const UserEntity.empty(),
      token: this?.token ?? '',
    );
  }
}

extension ToRegisterEntity on RegisterModel? {
  RegisterEntity toEntity() {
    return RegisterEntity(
      message: this?.message ?? '',
      token: this?.token ?? '',
      user: this?.userModel.toEntity() ?? const UserEntity.empty(),
      registerErrorEntity: this?.registerErrorModel.toEntity() ?? const RegisterErrorEntity.empty(),
    );
  }
}

extension ToUserEntity on UserModel? {
  UserEntity toEntity() {
    return UserEntity(
      id: this?.id ?? 0,
      name: this?.name ?? 'Unknown',
      lat: this?.lat ?? 0,
      long: this?.long ?? 0,
      ip: this?.ip ?? 'Unknown',
      country: this?.country ?? 'Unknown',
      email: this?.email ?? 'Unknown',
      creationDate: this?.creationDate ?? 'Unknown',
      emailVerifiedAt: this?.emailVerifiedAt ?? 'Unknown',
      isActive: this?.isActive ?? 0,
      lastUpdateDate: this?.lastUpdateDate ?? 'Unknown',
      fcm: this?.fcm ?? 'Unknown',
    );
  }
}

extension ToRegisterErrorEntity on RegisterErrorModel? {
  RegisterErrorEntity toEntity() {
    return RegisterErrorEntity(
      emailErrors: this?.emailErrors ?? const [],
      passwordErrors: this?.passwordErrors ?? const [],
    );
  }
}

extension ToLongLatEntity on FullLongLatModel? {
  LongLatEntity toEntity() {
    return LongLatEntity(
      lat: double.tryParse(this?.longLatModel?.lat ?? '0') ?? 0.0,
      long: double.tryParse(this?.longLatModel?.long ?? '0') ?? 0.0,
    );
  }
}

extension ToLinksEntity on Links? {
  LinksEntity toEntity() {
    return LinksEntity(
      links: this?.links ?? <String>[''],
      title: this?.title ?? 'Unknown',
      link: this?.link ?? 'Unknown',
      username: this?.username ?? 'Unknown',
    );
  }
}
