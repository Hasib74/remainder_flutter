import 'package:flutter/material.dart';

import '../../../core/utls/app_utls.dart';
import '../../../core/widgets/app_button_widgets.dart';
import '../../../core/widgets/app_text_filed.dart';
import 'add_crops_for_multi_select_items.dart';

class AddDiseaseScreen extends StatelessWidget {
  const AddDiseaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Disease"),
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
              hint: "Name",
            ),
            AppUtils.mediumGap,
            AppTextFiled(
              hint: "Scientific Name",
            ),
            AppUtils.mediumGap,
            AppTextFiled(
              hint: "Support Crops",
              isMultiSelect: true,
              menus: const [
                "Type One",
                "Type Two",
                "Type Three",
                "Type Four",
                "Type Five",
              ],
              addButtonTitle: "Add Crop",
              onAddButtonClick: () {
                print("Add Crop button clicked ====> ");

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const AddCropsForMultiSelectItems()));
              },
            ),
            AppUtils.mediumGap,
            AppUtils.mediumGap,
            AppUtils.mediumGap,
            AppButton(
              title: "Add Disease",
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
