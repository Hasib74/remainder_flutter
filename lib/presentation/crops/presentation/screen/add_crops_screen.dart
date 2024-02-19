import 'package:filednote/core/utls/app_utls.dart';
import 'package:filednote/core/widgets/app_button_widgets.dart';
import 'package:filednote/core/widgets/app_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../controller/crops_controller.dart';

class AddCropsScreen extends ConsumerWidget {
  CropsController? cropsController;

  AddCropsScreen({super.key, required this.cropsController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Crops"),
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
        child: Form(
          key: cropsController?.cropsAddFormState,
          child: Column(
            children: [
              AppTextFiled(
                controller: cropsController?.cropsNameTextEditingController,
                hint: "Crop Name",
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "Crops Name can not be empty";
                  }
                },
              ),
              AppUtils.mediumGap,
              AppTextFiled(
                controller: cropsController?.scientificNameController,
                hint: "Scientific Name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Scientific Name can not be empty";
                  }
                },
              ),
              AppUtils.mediumGap,
              AppTextFiled(
                controller: cropsController?.ipniCotroller,
                hint: "Plant Names Index(IPNI)(Optional)",
              ),
              AppUtils.mediumGap,
              AppUtils.mediumGap,
              AppButton(
                title: "Add Crop",
                onPressed: () {
                  cropsController?.addCrops(context, ref);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
