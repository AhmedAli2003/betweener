import 'package:betweener/core/constants/app_urls.dart';
import 'package:betweener/core/network/models/links_model.dart';
import 'package:betweener/core/network/models/login_model.dart';
import 'package:betweener/core/network/models/long_lat_model.dart';
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
  Future<RegisterModel> register({
    @Field('name') required String name,
    @Field('email') required String email,
    @Field('password') required String password,
    @Field('password_confirmation') required String passwordConfirmation,
  });

  @GET(AppUrls.links)
  Future<Links> getLinks(@Header('Authorization') String token);

  @POST(AppUrls.links)
  Future<Links> postLinks({
    @Header('Authorization') required String token,
    @Field('title') required String title,
    @Field('link') required String link,
    @Field('username') String username = '',
    @Field('isActive') int isActive = 0,
  });

  @PUT('${AppUrls.links}/{id}')
  Future<Links> updateLinks({
    @Path() required int id,
    @Header('Authorization') required String token,
    @Field('title') required String title,
    @Field('link') required String link,
    @Field('username') String username = '',
    @Field('isActive') int isActive = 0,
  });

  @DELETE('${AppUrls.links}/{id}')
  Future<Links> deleteLinks({
    @Path() required int id,
    @Header('Authorization') required String token,
  });

  @PUT('${AppUrls.update}/{id}')
  Future<FullLongLatModel> updateUserLocation({
    @Path() required int id,
  });
}
