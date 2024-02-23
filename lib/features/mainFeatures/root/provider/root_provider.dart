import 'package:filednote/l10n/language.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




enum RootMenuEnum {
  dashBoardScreen,
  experimentScreen,
  observationScreen,
  profileScreen;


  String tString(BuildContext context) {
    switch (this) {
      case RootMenuEnum.dashBoardScreen:
        return language(context)!.dashboard;
      case RootMenuEnum.experimentScreen:
        return language(context)!.experiment;
      case RootMenuEnum.observationScreen:
        return language(context)!.observation;
      case RootMenuEnum.profileScreen:
        return "Profile";
      default:
        return "DashBoard";
    }
  }
}

final rootProvider = StateNotifierProvider<RootProvider, RootMenuEnum>((ref) {
  return RootProvider();
});

class RootProvider extends StateNotifier<RootMenuEnum> {
  RootProvider() : super(RootMenuEnum.dashBoardScreen);

  void changeMenu(RootMenuEnum menu) {
    state = menu;
  }
}
