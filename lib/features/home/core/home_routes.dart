import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guia_moteis/features/arguments/suite_photos_arguments.dart';

import 'package:guia_moteis/features/home/presentation/cubit/get_motel_cubit.dart';
import 'package:guia_moteis/features/home/presentation/pages/home_page.dart';
import 'package:guia_moteis/features/home/presentation/pages/suite_photos_page.dart';
import 'package:guia_moteis/injection_container.dart';

sealed class HomeRoutes {
  static final List<RouteBase> routes = [
    GoRoute(
        path: HomePage.routeName,
        builder: (context, state) {
          return BlocProvider<GetMotelCubit>(
              create: (context) => sl<GetMotelCubit>(),
              child: const HomePage());
        }),
    GoRoute(
        path: SuitePhotosPage.routeName,
        builder: (context, state) {
          final arguments = state.extra as SuitePhotosArguments;
          return BlocProvider<GetMotelCubit>(
              create: (context) => sl<GetMotelCubit>(),
              child: SuitePhotosPage(
                args: arguments,
              ));
        })
  ];
}
