import 'package:api_testing/Model/user.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: 'https://gorest.co.in/public/v2/')
abstract class WebServices {
  factory WebServices(Dio dio, {String? baseUrl}) = _WebServices;

  @GET('users')
  Future<List<User>> getAllUsers();

  @GET('users/{id}')
  Future<User> getUserById(@Path('id') String id);

  @POST('users')
  Future<User> createNewUser(
    @Body() User newUser,
    @Header('Authorization') String token,
  );

  @DELETE('users/{id}')
  Future<dynamic> deleteUser(
    @Path('id') String id,
    @Header('Authorization') String token,
  );
}
