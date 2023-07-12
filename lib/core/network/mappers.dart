import 'package:betweener/core/entities/linkes_entity.dart';
import 'package:betweener/core/entities/login_entity.dart';
import 'package:betweener/core/entities/user_entity.dart';
import 'package:betweener/core/network/models/links_model.dart';
import 'package:betweener/core/network/models/login_model.dart';
import 'package:betweener/core/network/models/user_model.dart';

extension ToLoginEntity on LoginSuccessModel {
  LoginEntity toEntity() {
    return LoginEntity(
      user: userModel?.toEntity() ?? const UserEntity.empty(),
      token: token ?? '',
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
