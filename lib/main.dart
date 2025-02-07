import 'package:flutter/material.dart';
import 'package:guia_moteis/app.dart';

import 'package:guia_moteis/app_flavor.dart';
import 'package:guia_moteis/features/home/core/motel_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await motelInjection();

  await setPreferences();

  AppFlavor.build(
    name: 'Guia de Motéis GO',
    baseUrl: 'https://jsonkeeper.com',
  );
  runApp(const MyApp());
}
