import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:task_doc/core/networking/api_constant.dart';
import 'package:task_doc/features/home/data/api/home_api_constant.dart';
import 'package:task_doc/features/home/data/models/specialization_response_model.dart';
part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(HomeApiConstant.specializationEP)
  Future<SpecializationsResponseModel> getSpecialization();
}
