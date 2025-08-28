import 'package:task_doc/core/networking/api_error_handler.dart';
import 'package:task_doc/core/networking/api_result.dart';
import 'package:task_doc/core/networking/api_service.dart';
import 'package:task_doc/features/auth/sign_up/data/model/sign_up_request_body.dart';
import 'package:task_doc/features/auth/sign_up/data/model/sign_up_response.dart';

class SignUpRepo {
  final ApiService _apiService;

  SignUpRepo(this._apiService);

  Future<ApiResult<SignupResponse>> signUp(
    SignupRequestBody signupRequestBody,
  ) async {
    try {
      final response = await _apiService.signUp(signupRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
