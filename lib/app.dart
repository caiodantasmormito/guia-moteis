import 'package:flutter/material.dart';
import 'package:guia_moteis/app_flavor.dart';
import 'package:guia_moteis/core/infra/http/http_client.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => HttpClient(),
        ),
        Provider<SharedPreferences>(
          create: (context) => preferences,
        ),
        Provider(
          create: (context) => AuthenticatedClient(
            sharedPreferences: context.read<SharedPreferences>(),
          ),
        ),
        //...LoginInject.providers,
      ],
      child: MaterialApp.router(
        title: 'Guia de Motéis GO',
        debugShowCheckedModeBanner: false,
        routerConfig: router(),
      ),
    );
  }
}
