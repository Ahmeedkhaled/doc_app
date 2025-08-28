import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task_doc/core/networking/api_service.dart';
import 'package:task_doc/core/networking/dio_factory.dart';
import 'package:task_doc/features/login/data/repos/login_repo.dart';
import 'package:task_doc/features/login/logic/cubit/login_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
}
