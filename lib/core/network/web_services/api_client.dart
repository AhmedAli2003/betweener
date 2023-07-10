import 'package:betweener/core/constants/app_urls.dart';
import 'package:betweener/core/network/models/login_model.dart';
import 'package:betweener/core/network/models/register_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: AppUrls.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST(AppUrls.login)
  Future<LoginSuccessModel> login({
    @Field('email') required String email,
    @Field('password') required String password,
  });

  @POST(AppUrls.register)
  Future<RegisterSuccessModel> register({
    @Field('name') required String name,
    @Field('email') required String email,
    @Field('password') required String password,
    @Field('password_confirmation') required String passwordConfirmation,
  });
}
