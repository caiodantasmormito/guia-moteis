import 'package:get_it/get_it.dart';
import 'package:guia_moteis/features/home/core/motel_injection.dart';

import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

/// Dependency Injection used in application
Future<void> init() async {
  await motelInjection();

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}
