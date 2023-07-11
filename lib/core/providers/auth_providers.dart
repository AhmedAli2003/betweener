import 'package:betweener/core/entities/user_entity.dart';
import 'package:betweener/core/network/failures/failure.dart';
import 'package:betweener/core/network/repo/auth_repository.dart';
import 'package:betweener/core/network/request_status.dart';
import 'package:betweener/core/network/web_services/api_client.dart';
import 'package:betweener/core/providers/params/login_param.dart';
import 'package:betweener/core/providers/shared_preferences_provider.dart';
import 'package:betweener/core/util/network_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dioProvider = Provider<Dio>((_) => getDio());

Dio getDio() {
  final dio = Dio();
  // dio.interceptors.add(PrettyDioLogger());
// customization
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

final loginStatusProvider = StateProvider<RequestStatus>((ref) => RequestStatus.loading);
final loginFailureProvider = StateProvider<Failure?>((_) => null);

final loginProvider = FutureProvider.family<void, LoginParm>(
  (ref, loginParm) async {
    ref.watch(loginStatusProvider.notifier).state = RequestStatus.loading;
    final loginResponse = await ref.watch(authRepositoryProvider).login(
          email: loginParm.email,
          password: loginParm.password,
        );
    return loginResponse.fold(
      (failure) {
        ref.watch(loginStatusProvider.notifier).state = RequestStatus.error;
        ref.watch(loginFailureProvider.notifier).state = failure;
      },
      (loginEntity) {
        ref.watch(loginStatusProvider.notifier).state = RequestStatus.loaded;
        ref.read(loginEntityProvider.notifier).update(loginEntity.user);
        ref.read(appSharedPreferencesProvider.notifier).setAccessToken(loginEntity.token);
      },
    );
  },
);

final loginEntityProvider = StateNotifierProvider<UserEntityNotifier, UserEntity>(
  (ref) => UserEntityNotifier(
    const UserEntity.empty(),
  ),
);
