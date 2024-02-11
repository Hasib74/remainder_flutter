import 'package:filednote/core/widgets/app_button_widgets.dart';
import 'package:filednote/core/widgets/app_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ObserverScreen extends StatelessWidget {
  const ObserverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(16),
              AppTextFiled(
                hint: "Experiment Name",
                addButtonTitle: "Add Experiment",
                onAddButtonClick: () {
                  print("Add Experiment button clicked");
                },
                enabled: false,
                menus: const [
                  "Experiment One",
                  "Experiment Two",
                  "Experiment Three",
                  "Experiment Four",
                  "Experiment Five",
                ],
              ),
              Gap(16),
              AppTextFiled(
                hint: "Observation Name",
              ),
              Gap(16),
              AppTextFiled(
                hint: "Type",
                enabled: false,
                menus: const [
                  "Numeric",
                  "Count",
                  "Category",
                  "Percentage",
                  "Text",
                ],
              ),
              Gap(16),
              AppTextFiled(
                textInputType: TextInputType.number,
                hint:
                    "Total number of observation per treatment and replication",
              ),
              Gap(16),
              Gap(16),
              AppButton(
                title: "Add Observation",
                onPressed: () {
                  // context.goNamed(AppRoutes.addExp);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
