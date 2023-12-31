import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remainder_flutter/domain/home_model.dart';

import '../sealed/home_state.dart';

var homeControllerProvider =
    StateNotifierProvider<HomeController, HomeState>((ref) {
  HomeController homeController = HomeController();

  homeController.getHomeData();

  return homeController;
});

class HomeController extends StateNotifier<HomeState> {
  HomeController() : super(const HomeState.initial());

  HomeModel? homeModel;

  void getHomeData() async {
    state = const HomeState.loading();
    await Future.delayed(const Duration(seconds: 3));
    state = HomeState.success(
      HomeModel(
          title: 'My Title', description: 'My Description', image: 'My Image'),
    );
  }

  addNewData() async {
    homeModel = HomeModel(
        title: 'My Title two',
        description: 'My Description two',
        image: 'My Image two');

    state = HomeState.success(homeModel!);
  }

  deleteData() async {
    homeModel = null;

    state = HomeState.success(homeModel!);
  }

  updateData() async {
    homeModel = HomeModel(
        title: 'My Title three',
        description: 'My Description three',
        image: 'My Image three');

    state = HomeState.success(homeModel!);
  }
}
