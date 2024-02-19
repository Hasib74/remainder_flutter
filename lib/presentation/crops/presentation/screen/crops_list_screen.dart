import 'package:filednote/core/route/app_routes.dart';
import 'package:filednote/presentation/crops/presentation/controller/crops_controller.dart';
import 'package:filednote/presentation/crops/presentation/provider/crops_list_providers.dart';
import 'package:filednote/presentation/crops/presentation/screen/add_crops_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';

class CropListScreen extends ConsumerStatefulWidget {
  const CropListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CropsListScreenState();
}

class _CropsListScreenState extends ConsumerState<CropListScreen> {
  CropsController? cropsController = CropsController();

  @override
  void initState() {
    super.initState();

    print("Calling crops .... }");

    cropsController?.getAllCrops(context, ref);
  }

  @override
  Widget build(BuildContext context) {
    var cropsList = ref.watch(cropsListProvider);

    return Scaffold(
        floatingActionButton: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddCropsScreen(
                          cropsController: cropsController,
                        )));
          },
          child: const Text("Add Crops"),
        ),
        body: SafeArea(
          child: Column(
            children: [
              const Text(
                "Crops List",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SearchBar(
                  elevation: MaterialStateProperty.all(1),
                  trailing: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.search,
                        color: AppColor.secondaryTextColor,
                      ),
                    )
                  ],
                  hintText: 'Search',
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, int index) {
                      var data = cropsList.cropsList?[index];
                      return ListTile(
                        title: Text(cropsList.cropsList?[index].name ?? ""),
                        trailing: IconButton(
                          onPressed: () {
                            cropsController?.deleteCrops(context , ref ,  data?.id);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      );
                    },
                    separatorBuilder: (context, int index) {
                      return const Divider();
                    },
                    itemCount: cropsList.cropsList?.length ?? 0),
              ),
            ],
          ),
        ));
  }
}
