import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:remainder_flutter/core/route/app_routes.dart';
import 'package:remainder_flutter/core/route/router_notifier.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  return GoRouter(
      routes: router.routes,
      initialLocation: AppRoutes.splashScreen,
      refreshListenable: router);
});
