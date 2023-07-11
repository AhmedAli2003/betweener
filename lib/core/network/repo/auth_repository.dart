import 'package:betweener/core/entities/login_entity.dart';
import 'package:betweener/core/network/failures/failure.dart';
import 'package:betweener/core/network/mappers.dart';
import 'package:betweener/core/network/web_services/api_client.dart';
import 'package:betweener/core/util/network_info.dart';
import 'package:dartz/dartz.dart';

typedef LoginResponse = Future<Either<Failure, LoginEntity>>;


class AuthRepository {
  final ApiClient _apiClient;
  final NetworkInfo _networkInfo;

  const AuthRepository({
    required ApiClient apiClient,
    required NetworkInfo networkInfo,
  })  : _apiClient = apiClient,
        _networkInfo = networkInfo;

  LoginResponse login({
    required String email,
    required String password,
  }) async {
    try {
      final loginResponse = await _apiClient.login(email: email, password: password);
      return Right(loginResponse.toEntity());
    } catch (e) {
      if (!(await _networkInfo.hasConnection)) {
        return const Left(Failure(0, 'Check your internet connection'));
      }
      return Left(Failure(0, e.toString()));
    }
  }
}
