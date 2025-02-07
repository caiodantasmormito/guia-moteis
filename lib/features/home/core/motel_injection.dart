import 'package:guia_moteis/core/infra/http/http_client.dart';

import 'package:guia_moteis/features/home/data/datasource/motel_datasource_impl.dart';
import 'package:guia_moteis/features/home/data/repositories/motel_repository_impl.dart';

import 'package:guia_moteis/features/home/domain/usecase/get_motel_usecase.dart';
import 'package:guia_moteis/features/home/presentation/cubit/get_motel_cubit.dart';
import 'package:guia_moteis/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> motelInjection() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton<HttpClient>(
    () => HttpClient(),
  );
  sl
    ..registerLazySingleton<MotelDatasourceImpl>(
      () => MotelDatasourceImpl(httpClient: sl<HttpClient>()),
    )
    ..registerLazySingleton<MotelRepositoryImpl>(
      () => MotelRepositoryImpl(sl<MotelDatasourceImpl>()),
    )
    ..registerLazySingleton<GetMotelUsecase>(
      () => GetMotelUsecase(motelRepository: sl<MotelRepositoryImpl>()),
    )
    ..registerFactory<GetMotelCubit>(
      () => GetMotelCubit(getMotelUsecase: sl<GetMotelUsecase>()),
    );
}
