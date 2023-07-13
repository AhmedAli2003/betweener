import 'package:betweener/core/entities/linkes_entity.dart';
import 'package:betweener/core/network/failures/failure.dart';
import 'package:betweener/core/network/mappers.dart';
import 'package:betweener/core/network/web_services/api_client.dart';
import 'package:betweener/core/util/network_info.dart';
import 'package:dartz/dartz.dart';

typedef LinksResponse = Future<Either<Failure, LinksEntity>>;

class LinksRepository {
  final ApiClient _apiClient;
  final NetworkInfo _networkInfo;

  LinksRepository({
    required ApiClient apiClient,
    required NetworkInfo networkInfo,
  })  : _apiClient = apiClient,
        _networkInfo = networkInfo;

  LinksResponse getLinks(String token) async {
    try {
      final response = await _apiClient.getLinks(token);
      return Right(response.toEntity());
    } catch (error) {
      if (!(await _networkInfo.hasConnection)) {
        return const Left(Failure(0, 'Check your internet connection'));
      }
      return Left(Failure(0, error.toString()));
    }
  }

  LinksResponse postLinks({token, required String title, required String link, String username = '', int isActive = 0}) async {
    try {
      final response = await _apiClient.postLinks(token: token, title: title, link: link);
      return Right(response.toEntity());
    } catch (error) {
      if (!(await _networkInfo.hasConnection)) {
        return const Left(Failure(0, 'Check your internet connection'));
      }
      return Left(Failure(0, error.toString()));
    }
  }

  LinksResponse deleteLinks(int id, String token) async {
    try {
      final response = await _apiClient.deleteLinks(id: id, token: token);
      return Right(response.toEntity());
    } catch (error) {
      if (!(await _networkInfo.hasConnection)) {
        return const Left(Failure(0, 'Check your internet connection'));
      }
      return Left(Failure(0, error.toString()));
    }
  }

  LinksResponse updateLinks(int id, String token, String title, String link, {String username = '', int isActive = 0}) async {
    try {
      final response = await _apiClient.updateLinks(id: id, token: token, title: title, link: link);

      return Right(response.toEntity());
    } catch (error) {
      if (!(await _networkInfo.hasConnection)) {
        return const Left(Failure(0, 'Check your internet connection'));
      }
      return Left(Failure(0, error.toString()));
    }
  }
}
