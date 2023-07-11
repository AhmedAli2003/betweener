import 'package:betweener/core/entities/login_entity.dart';
import 'package:betweener/core/entities/register_entity.dart';
import 'package:betweener/core/network/failures/error_handler.dart';
import 'package:betweener/core/network/failures/failure.dart';
import 'package:betweener/core/network/mappers.dart';
import 'package:betweener/core/network/web_services/api_client.dart';
import 'package:betweener/core/providers/params/login_param.dart';
import 'package:betweener/core/providers/params/register_param.dart';
import 'package:betweener/core/util/network_info.dart';
import 'package:dartz/dartz.dart';

typedef LoginResponse = Future<Either<Failure, LoginEntity>>;
typedef RegisterResponse = Future<Either<Failure, RegisterEntity>>;
typedef RequestResponse<T> = Future<Either<Failure, T>>;

class AuthRepository {
  final ApiClient _apiClient;
  final NetworkInfo _networkInfo;

  const AuthRepository({
    required ApiClient apiClient,
    required NetworkInfo networkInfo,
  })  : _apiClient = apiClient,
        _networkInfo = networkInfo;

  RequestResponse<T> _request<T>(Future<T> Function() request) async {
    if (await _networkInfo.isReady) {
      try {
        return Right(await request());
      } catch (exception) {
        return Left(ErrorHandler.handle(exception).failure);
      }
    } else {
      return Left(ConnectionState.noInternetConnection.getFailure());
    }
  }

  LoginResponse login(LoginParm loginParm) async {
    return _request<LoginEntity>(
      () async => (await _apiClient.login(
        email: loginParm.email,
        password: loginParm.password,
      ))
          .toEntity(),
    );
  }

  RegisterResponse register(RegisterParam registerParam) async {
    return _request<RegisterEntity>(
      () async => (await _apiClient.register(
        name: registerParam.name,
        email: registerParam.email,
        password: registerParam.password,
        passwordConfirmation: registerParam.passwordConfirmation,
      ))
          .toEntity(),
    );
  }

  // LoginResponse login({
  //   required String email,
  //   required String password,
  // }) async {
  //   if (await _networkInfo.isReady) {
  //     try {
  //       final loginResponse = await _apiClient.login(
  //         email: email,
  //         password: password,
  //       );
  //       return Right(loginResponse.toEntity());
  //     } catch (exception) {
  //       return Left(ErrorHandler.handle(exception).failure);
  //     }
  //   } else {
  //     return Left(ConnectionState.noInternetConnection.getFailure());
  //   }
  // }

  // RegisterResponse register({
  //   required String name,
  //   required String email,
  //   required String password,
  //   required String passwordConfirmation,
  // }) async {
  //   if (await _networkInfo.isReady) {
  //     try {
  //       final registerResponse = await _apiClient.register(
  //         name: name,
  //         email: email,
  //         password: password,
  //         passwordConfirmation: passwordConfirmation,
  //       );
  //       return Right(registerResponse.toEntity());
  //     } catch (exception) {
  //       return Left(ErrorHandler.handle(exception).failure);
  //     }
  //   } else {
  //     return Left(ConnectionState.noInternetConnection.getFailure());
  //   }
  // }
}
