import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:task_doc/core/networking/api_constant.dart';
import 'package:task_doc/features/auth/login/data/models/login_request_body.dart';
import 'package:task_doc/features/auth/login/data/models/login_response.dart';
import 'package:task_doc/features/auth/sign_up/data/model/sign_up_request_body.dart';
import 'package:task_doc/features/auth/sign_up/data/model/sign_up_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstant.loginEndpoint)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstant.signUpEndpoint)
  Future<SignupResponse> signUp(@Body() SignupRequestBody signupRequestBody);
}
