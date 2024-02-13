import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:filednote/core/route/app_routes.dart';
import 'package:filednote/core/route/router_notifier.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  router.addListener(() {
    print("routerProvider : ${router.routes}");
  });
  return GoRouter(
    navigatorKey: AppRoutes.rootKey,
    routes: router.routes,
    initialLocation: AppRoutes.splashScreen,
    refreshListenable: router,
    redirect: (BuildContext context, GoRouterState state) {},
  );
});
