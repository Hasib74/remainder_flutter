import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:filednote/core/theme/app_colors.dart';
import 'package:filednote/presentation/homeScreen/controllers/home_controller.dart';
import 'package:filednote/presentation/homeScreen/sections/app_bottom_bar.dart';
import 'package:filednote/presentation/homeScreen/sections/body.dart';
import 'package:filednote/presentation/homeScreen/sections/top_app_bar.dart';

import 'controllers/selected_date_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColor.primaryColor));

    return const Scaffold(
      bottomNavigationBar: AppBottomBar(),
      body: SafeArea(
        child: Column(
          children: [
            TopAppBar(),
            HomeBody(),
          ],
        ),
      ),
    );
  }
}
