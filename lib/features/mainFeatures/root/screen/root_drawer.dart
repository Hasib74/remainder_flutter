import 'dart:ffi';

import 'package:filednote/core/route/app_routes.dart';
import 'package:filednote/l10n/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../provider/root_provider.dart';

class RootDrawer extends ConsumerWidget {
  // Widget child;

  final StatefulNavigationShell navigationShell;

  final GlobalKey<ScaffoldState> scaffoldKey;

  const RootDrawer({
    super.key,
    required this.navigationShell,
    required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
        child: ListView(
      children: [
        Gap(16),
        ListTile(
          title: Text(language(context)!.dashboard),
          onTap: () {
            // context.goNamed(AppRoutes.dashBoard);

            scaffoldKey.currentState?.closeDrawer();

            navigationShell.goBranch(0,
                initialLocation: 0 == navigationShell.currentIndex);
          },
        ),
        ListTile(
          title: Text(language(context)!.experiment),
          onTap: () {
            scaffoldKey.currentState?.closeDrawer();

            navigationShell.goBranch(1,
                initialLocation: 1 == navigationShell.currentIndex);
          },
        ),
        ListTile(
          title: Text(language(context)!.observation),
          onTap: () {
            scaffoldKey.currentState?.closeDrawer();

            navigationShell.goBranch(2,
                initialLocation: 2 == navigationShell.currentIndex);
          },
        ),
      ],
    ));
  }
}
