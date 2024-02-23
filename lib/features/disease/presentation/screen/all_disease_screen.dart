import 'package:filednote/core/route/app_routes.dart';
import 'package:filednote/core/widgets/app_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../controller/disease_controller.dart';
import '../provider/disease_provider.dart';

class AllDiseaseScreen extends ConsumerStatefulWidget {
  @override
  _AllDiseaseScreenState createState() => _AllDiseaseScreenState();
}

class _AllDiseaseScreenState extends ConsumerState<AllDiseaseScreen> {
  DiseaseController? diseaseController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    diseaseController = DiseaseController();

    diseaseController?.getAllDisease(context, ref);
  }

  @override
  Widget build(BuildContext context) {
    var diseaseList = ref.watch(diseaseListProvider);

    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          context.push(AppRoutes.addDisease);
        },
        child: const Text("Add Disease"),
      ),
      appBar: AppBar(
        title: const Text("All Disease"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            // color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        diseaseList.diseaseList?[index].name ?? "",
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                  itemCount: diseaseList.diseaseList?.length ?? 0),
            ),
          ],
        ),
      ),
    );
  }
}
