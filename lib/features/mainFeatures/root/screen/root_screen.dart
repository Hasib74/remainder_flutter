import 'package:filednote/core/theme/app_colors.dart';
import 'package:filednote/features/mainFeatures/root/screen/root_drawer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../l10n/language.dart';

class RootScreen extends ConsumerWidget {
  final Widget? child;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final StatefulNavigationShell navigationShell;

  RootScreen({super.key, this.child, required this.navigationShell});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: AppColor.whiteColor,
          ),
          onPressed: () {
            // context.goNamed(AppRoutes.rootScreen);

            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Text(_title(context, navigationShell).toString()),
      ),
      body: child ?? navigationShell,
      drawer: RootDrawer(
        navigationShell: navigationShell,
        scaffoldKey: _scaffoldKey,
      ),
    );
  }


  String? _title(
      BuildContext context, StatefulNavigationShell navigationShell) {
    switch (navigationShell.currentIndex) {
      case 0:
        return language(context)!.dashboard;
      case 1:
        return language(context)!.experiment;
      case 2:
        return language(context)!.observation;
      case 3:
        return language(context)!.profile;
    }
  }
}
