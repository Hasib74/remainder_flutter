import 'package:flutter/material.dart';

import '../../../core/utls/app_utls.dart';
import '../../../core/widgets/app_button_widgets.dart';
import '../../../core/widgets/app_text_filed.dart';

class AddCropsForMultiSelectItems extends StatelessWidget {
  const AddCropsForMultiSelectItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Crops For Multi Select Items"),
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
              AppTextFiled(
                enabled: false,
                hint: "Crops",
                menus: const [
                  "Type One",
                  "Type Two",
                  "Type Three",
                  "Type Four",
                  "Type Five",
                ],
              ),
              AppUtils.mediumGap,
              AppTextFiled(
                hint: "Causal Organism",
              ),
              AppUtils.mediumGap,
              AppTextFiled(
                hint: "Example Format",
              ),
              AppUtils.mediumGap,
              AppTextFiled(
                hint: "Details",
              ),
              AppUtils.largeGap,
              AppButton(
                title: "Add Crops",
                onPressed: () {
                  // context.goNamed(AppRoutes.addExp);
                },
              ),
            ],
          ),
        ));
  }
}
