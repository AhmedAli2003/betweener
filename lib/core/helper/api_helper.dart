import '../network/models/api_response.dart';

mixin ApiHelper {
  ApiResponse get errorResponse =>
      ApiResponse('Something error ,try again', false);


}

