import 'package:filednote/core/utls/app_utls.dart';
import 'package:filednote/core/widgets/app_text_filed.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/app_button_widgets.dart';

class AddExperiments extends StatelessWidget {
  const AddExperiments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppUtils.largeGap,
              AppTextFiled(
                hint: "Experiment code",
              ),
              AppUtils.mediumGap,
              AppTextFiled(
                hint: "Experiment Name",
              ),
              AppUtils.mediumGap,
              AppTextFiled(
                hint: "Treatment",
              ),
              AppUtils.mediumGap,
              AppTextFiled(
                hint: "Replication",
              ),
              AppUtils.mediumGap,
              const Text("Upload Treatment Names Excel File"),
              AppUtils.mediumGap,
              OutlinedButton(
                  onPressed: () {}, child: const Text("Choose file")),
              AppUtils.largeGap,
              AppButton(
                title: "Save",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
