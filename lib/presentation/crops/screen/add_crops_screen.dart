import 'package:filednote/core/utls/app_utls.dart';
import 'package:filednote/core/widgets/app_button_widgets.dart';
import 'package:filednote/core/widgets/app_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddCropsScreen extends StatelessWidget {
  const AddCropsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: [
            AppTextFiled(
              hint: "Crop Name",
            ),
            AppUtils.mediumGap,
            AppTextFiled(
              hint: "Scientific Name",
            ),
            AppUtils.mediumGap,
            AppTextFiled(
              hint: "Plant Names Index(IPNI)(Optional)",
            ),
            AppUtils.mediumGap,
            AppUtils.mediumGap,
            AppButton(
              title: "Add Crop",
              onPressed: () {
                // context.goNamed(AppRoutes.addExp);
              },
            ),
          ],
        ),
      ),
    );
  }
}
