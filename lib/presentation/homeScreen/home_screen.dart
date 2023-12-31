import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:remainder_flutter/presentation/homeScreen/controllers/home_controller.dart';

class HomeScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build

    final homeController = ref.watch(homeControllerProvider);

    return Scaffold(
      body: Column(
        children: [
          Center(
            child: homeController.when(
                initial: () => const CircularProgressIndicator(),
                loading: () => const Text("Loading..."),
                success: (homeModel) {
                  return Text(homeModel.title);
                },
                error: () {
                  return const Text("Error");
                }),
          ),
          ElevatedButton(
              onPressed: () {
                //  homeControllerProvider.notifier.
                ref.read(homeControllerProvider.notifier).addNewData();
              },
              child: Text("Add New Data")),
        ],
      ),
    );
  }
}
