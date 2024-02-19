import 'package:flutter/cupertino.dart';

class AppRoutes {
  AppRoutes._();

  static GlobalKey<NavigatorState> rootKey =
      GlobalKey<NavigatorState>(debugLabel: "rootKey");
  static GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: "shellNavigatorKey");

  static const String splashScreen = '/';
  static const String homeScreen = '/home';
  static const String onBoarding = '/onBoarding';
  static const String signIn = '/login';
  static const String auth = '/auth';
  static const String signUp = '/register';
  static const String rootScreen = "/root_screen";
  static const String rootDrawer = "/root_drawer";
  static const String experiment = "/experiment";
  static const String addExp = "add_exp";
  static const String dashBoard = "/dash_board";
  static const String observation = "/observation";
  static const String cropsList = "/crop_list";

//go route
}
