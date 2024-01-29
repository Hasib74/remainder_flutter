import 'package:filednote/core/utls/app_utls.dart';
import 'package:filednote/core/widgets/app_text_filed.dart';
import 'package:filednote/presentation/mainFeatures/experiments/function/experiment_controller.dart';
import 'package:filednote/presentation/mainFeatures/experiments/provider/add_replication_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_button_widgets.dart';
import 'add_replication.dart';

class AddExperiments extends ConsumerWidget {
  AddExperiments({super.key});

  ExperimentController controller = ExperimentController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: true,
      child: Scaffold(
        /*  appBar: AppBar(
          title: const Text("Add Experiment"),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),*/
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppTextFiled(
                  controller: controller.codeTextEditingController,
                  hint: "Experiment code",
                ),
                AppUtils.mediumGap,
                AppTextFiled(
                  controller: controller.nameTextEditingController,
                  hint: "Experiment Name",
                ),
                AppUtils.mediumGap,
                AppTextFiled(
                  controller: controller.locationTextEditingController,
                  hint: "Location",
                ),
                AppUtils.mediumGap,
                AppTextFiled(
                  enabled: false,
                  menus: const [
                    "Paddy",
                    "Meat",
                    "Cow's",
                    "Goat's",
                    "Sheep's",
                    "Poultry",
                    "Fish",
                    "Others"
                  ],
                  onSelectedItem: (v) {
                    controller.cropsTextEditingController.text = v;
                  },
                  controller: controller.cropsTextEditingController,
                  hint: "Crops",
                ),
                AppUtils.mediumGap,
                AppTextFiled<String>(
                  enabled: false,
                  controller: controller.diseaseTextEditingController,
                  hint: "Disease",
                  menus: const [
                    "Fairy ring",
                    "Brown spot",
                    "Blast",
                    "Sheath blight",
                    "Bacterial leaf blight",
                    "Bacterial leaf streak",
                    "Bacterial panicle blight",
                    "Bacterial grain rot",
                    "Bacterial sheath brown rot",
                    "Bacterial seedling rot",
                    "Bacterial leaf streak",
                    "Bacterial panicle blight",
                    "Bacterial grain rot",
                    "Bacterial sheath brown rot",
                    "Bacterial seedling rot",
                    "Bacterial leaf streak",
                    "Bacterial panicle blight",
                  ],
                  onSelectedItem: (v) {
                    controller.diseaseTextEditingController.text = v;
                  },
                ),
                AppUtils.mediumGap,
                AppTextFiled(
                  textInputType: TextInputType.number,
                  controller: controller.treatmentTextEditingController,
                  hint: "Number Of Treatment",
                  onChanged: (String? v) {
                    if (v != null && v.isNotEmpty) {
                      ref
                          .read(addReplicationProvider.notifier)
                          .setTreatment(int.parse(v));
                    } else {
                      ref.read(addReplicationProvider.notifier).setTreatment(0);
                    }
                  },
                ),
                AppUtils.mediumGap,
                AppTextFiled(
                  textInputType: TextInputType.number,
                  controller: controller.replicationTextEditingController,
                  hint: "Replication",
                  onChanged: (v) {
                    if (v != null && v.isNotEmpty) {
                      print("replication: $v");
                      ref
                          .read(addReplicationProvider.notifier)
                          .setReplication(int.parse(v));
                    } else {
                      ref
                          .read(addReplicationProvider.notifier)
                          .setReplication(0);
                    }
                  },
                ),
                AppUtils.mediumGap,
                AppUtils.largeGap,
                const AddReplication(),
                AppUtils.largeGap,
                AppButton(
                  title: "Save",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
