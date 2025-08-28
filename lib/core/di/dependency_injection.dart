import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task_doc/core/networking/api_service.dart';
import 'package:task_doc/core/networking/dio_factory.dart';
import 'package:task_doc/features/auth/login/data/repos/login_repo.dart';
import 'package:task_doc/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:task_doc/features/auth/sign_up/data/repo/sign_up_repo.dart';
import 'package:task_doc/features/auth/sign_up/logic/cubit/sign_up_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //sign up
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
}
