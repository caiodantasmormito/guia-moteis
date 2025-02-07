import 'package:go_router/go_router.dart';
import 'package:guia_moteis/features/home/core/home_routes.dart';

GoRouter router() {
  return GoRouter(
    routes: [
      /*GoRoute(
        path: HomePage.routeName,
        builder: (context, state) => const HomePage(),
      ),*/

      ...HomeRoutes.routes,
    ],
  );
}
