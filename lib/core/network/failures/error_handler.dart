import 'package:betweener/core/network/failures/failure.dart';
import 'package:dio/dio.dart';

enum ConnectionState {
  success(200, 'success'),
  noContent(201, 'success'),
  badRequest(400, 'Bad request, try again later'),
  unauthorized(401, 'Unauthorized, try again later'),
  forbidden(403, 'Forbidden request, try again later'),
  notFound(404, 'Not found, try again later'),
  internalServerError(500, 'Internal Server Error, try again later'),
  connectTimeout(-1, 'Connect timeout, try again later'),
  receiveTimeout(-2, 'Receive timeout, try again later'),
  sendTimeout(-3, 'Send timeout, try again'),
  cancel(-4, 'Cancel timeout, try again'),
  cacheError(-5, 'Cache error, try again later'),
  noInternetConnection(-6, 'No Internet connection'),
  unknownError(-7, 'Unknown error, try again later');

  final int statusCode;
  final String message;
  const ConnectionState(this.statusCode, this.message);
}

// extension ConnectionStateExtension on ConnectionState {
//   Failure getFailure() {
//     switch(this) {
//       case ConnectionState.success:

//     }
//   }
// }

class ErrorHandler implements Exception {
  late final Failure failure;

  ErrorHandler.handle(dynamic exception) {
    if (exception is DioException) {
    } else {}
  }
}
