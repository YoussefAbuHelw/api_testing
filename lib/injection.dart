import 'package:api_testing/cubit/my_cubit.dart';
import 'package:api_testing/repos/my_repo.dart';
import 'package:api_testing/services/web_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<WebServices>(
    () => WebServices(createAndSetupDio()),
  );
  getIt.registerLazySingleton<MyRepo>(() => MyRepo(getIt()));
  getIt.registerLazySingleton<MyCubit>(() => MyCubit(getIt()));
}

Dio createAndSetupDio() {
  Dio dio = Dio();

  dio.interceptors.add(
    LogInterceptor(
      requestBody: true,
      responseBody: true,
      request: true,
      error: true,
    ),
  );

  return dio;
}

// import 'package:api_testing/cubit/my_cubit.dart';
// import 'package:api_testing/repos/my_repo.dart';
// import 'package:api_testing/services/web_services.dart';
// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
//
// final getIt = GetIt.instance;
//
// void initGetIt() {
//   getIt.registerLazySingleton<MyCubit>(() => MyCubit(getIt()));
//   getIt.registerLazySingleton<MyRepo>(() => MyRepo(getIt()));
//   getIt.registerLazySingleton<WebServices>(
//     () => WebServices(createAndSetupDio()),
//   );
// }
//
// Dio createAndSetupDio() {
//   // final options = BaseOptions(
//   //   connectTimeout: const Duration(seconds: 1),
//   //   receiveTimeout: const Duration(seconds: 10),
//   // );
//   //
//   // Dio dio = Dio(options);
//   Dio dio = Dio();
//
//
//   // dio.options
//   //   ..connectTimeout = const Duration(seconds: 10)
//   //   ..receiveTimeout = const Duration(seconds: 10);
//   //
//   dio.interceptors.add(
//     LogInterceptor(
//       requestBody: true,
//       responseBody: true,
//       request: true,
//       error: true,
//     ),
//   );
//   return dio;
// }
