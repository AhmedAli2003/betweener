import 'package:betweener/core/entities/register_entity.dart';
import 'package:betweener/core/entities/user_entity.dart';
import 'package:betweener/core/network/failures/failure.dart';
import 'package:betweener/core/network/repo/auth_repository.dart';
import 'package:betweener/core/network/request_status.dart';
import 'package:betweener/core/network/web_services/api_client.dart';
import 'package:betweener/core/providers/params/login_param.dart';
import 'package:betweener/core/providers/params/register_param.dart';
import 'package:betweener/core/providers/shared_preferences_provider.dart';
import 'package:betweener/core/util/network_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dioProvider = Provider<Dio>((_) => getDio());

Dio getDio() {
  final dio = Dio();
  if (!kReleaseMode) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }
  return dio;
}

final apiClientProvider = Provider<ApiClient>(
  (ref) => ApiClient(
    ref.watch(dioProvider),
  ),
);

final internetConnectionCheckerProvider = Provider<InternetConnectionChecker>(
  (_) => InternetConnectionChecker(),
);

final networkInfoProvider = Provider<NetworkInfo>(
  (ref) => NetworkInfoImpl(
    ref.watch(internetConnectionCheckerProvider),
  ),
);

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(
    apiClient: ref.watch(apiClientProvider),
    networkInfo: ref.watch(networkInfoProvider),
  ),
);

final loginStatusProvider = StateProvider<RequestStatus>(
  (ref) => RequestStatus.start,
);

final loginFailureProvider = StateProvider<Failure?>((_) => null);

final loginProvider = FutureProvider.family<void, LoginParm>(
  (ref, loginParm) async {
    Future.delayed(Duration.zero, () {
      ref.read(loginStatusProvider.notifier).state = RequestStatus.loading;
    });
    final loginResponse = await ref.watch(authRepositoryProvider).login(loginParm);
    return loginResponse.fold(
      (failure) {
        Future.delayed(Duration.zero, () {
          ref.read(loginStatusProvider.notifier).state = RequestStatus.error;
          ref.read(loginFailureProvider.notifier).state = failure;
        });
      },
      (loginEntity) {
        Future.delayed(Duration.zero, () {
          ref.read(loginStatusProvider.notifier).state = RequestStatus.loaded;
        });
        ref.read(userEntityProvider.notifier).update(loginEntity.user);
        ref.read(appSharedPreferencesProvider.notifier)
          ..setAccessToken(loginEntity.token)
          ..setUserEmail(loginEntity.user.email)
          ..setUserId(loginEntity.user.id)
          ..setUserPassword(loginParm.password)
          ..setIsLoggedIn(true);
      },
    );
  },
);

final registerStatusProvider = StateProvider<RequestStatus>(
  (ref) => RequestStatus.start,
);

final registerFailureProvider = StateProvider<Failure?>((_) => null);

final registerProvider = FutureProvider.family<void, RegisterParam>(
  (ref, registerParam) async {
    Future.delayed(Duration.zero, () {
      ref.read(registerStatusProvider.notifier).state = RequestStatus.loading;
    });
    final registerResponse = await ref.read(authRepositoryProvider).register(registerParam);
    registerResponse.fold(
      (failure) {
        Future.delayed(Duration.zero, () {
          ref.read(registerStatusProvider.notifier).state = RequestStatus.error;
          ref.read(registerFailureProvider.notifier).state = failure;
        });
      },
      (registerEntity) {
        Future.delayed(Duration.zero, () {
          if (registerEntity.message == 'something wrong' || registerEntity.token.isEmpty || registerEntity.user == const UserEntity.empty()) {
            ref.read(registerStatusProvider.notifier).state = RequestStatus.error;
          } else {
            ref.watch(registerStatusProvider.notifier).state = RequestStatus.loaded;
          }
        });
        ref.read(userEntityProvider.notifier).update(registerEntity.user);
        ref.read(registerEntityProvider.notifier).state = registerEntity;
        ref.read(appSharedPreferencesProvider.notifier)
          ..setAccessToken(registerEntity.token)
          ..setUserEmail(registerEntity.user.email)
          ..setUserId(registerEntity.user.id)
          ..setUserPassword(registerParam.password)
          ..setIsLoggedIn(true);
      },
    );
  },
);

final registerEntityProvider = StateProvider<RegisterEntity>((ref) {
  return const RegisterEntity.empty();
});

final userEntityProvider = StateNotifierProvider<UserEntityNotifier, UserEntity>(
  (ref) => UserEntityNotifier(
    const UserEntity.empty(),
  ),
);
