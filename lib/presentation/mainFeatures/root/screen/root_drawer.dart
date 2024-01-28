import 'package:filednote/core/route/app_routes.dart';
import 'package:filednote/l10n/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../provider/root_provider.dart';

class RootDrawer extends ConsumerWidget {
  // Widget child;

  final StatefulNavigationShell navigationShell;

  RootDrawer({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
        child: ListView(
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text("Drawer Header"),
        ),
        ListTile(
          title: Text(language(context)!.dashboard),
          onTap: () {
            // context.goNamed(AppRoutes.dashBoard);

            navigationShell.goBranch(0);
          },
        ),
        ListTile(
          title: Text(language(context)!.experiment),
          onTap: () {
            navigationShell.goBranch(1);
          },
        ),
        ListTile(
          title: Text(language(context)!.observation),
          onTap: () {
            Navigator.pop(context);

            ref
                .read(rootProvider.notifier)
                .changeMenu(RootMenuEnum.observationScreen);
          },
        ),
      ],
    ));
  }
}
