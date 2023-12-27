import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:remainder_flutter/core/route/route_provider.dart';

class AppWidget extends HookConsumerWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(routerProvider, (previous, next) {
      print("Previous :  ${previous}");

      print("Next : ${next}");
    });

    return MaterialApp.router(
      themeMode: ThemeMode.light,
      routeInformationParser: ref.watch(routerProvider).routeInformationParser,
      routerDelegate: ref.watch(routerProvider).routerDelegate,
      routeInformationProvider:
          ref.watch(routerProvider).routeInformationProvider,

     // routerConfig: ref.watch(routerProvider).,
    );
  }
}
