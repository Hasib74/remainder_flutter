import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:filednote/core/route/app_routes.dart';
import 'package:filednote/core/route/route_provider.dart';

import 'auth/provider/auth_provider.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(const Duration(seconds: 3), () {
      // ref.read(routerProvider).go(AppRoutes.homeScreen);

      ref.read(authTokenProvider.notifier).getToken()?.then((value) {
        if (value != null) {
          ref.read(routerProvider).go(AppRoutes.dashBoard);
        } else {
          ref.read(routerProvider).go(AppRoutes.auth);
        }
      });
    });

    return const Scaffold(
      body: Center(
        child: LinearProgressIndicator(),
      ),
    );
  }
}
