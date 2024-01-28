import 'package:filednote/core/route/app_routes.dart';
import 'package:filednote/core/utls/app_utls.dart';
import 'package:filednote/core/widgets/app_button_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExperimentScreen extends StatelessWidget {
  const ExperimentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        AppUtils.mediumGap,
        AppButton(
          //height: ,

          title: "Add Experiment",
          onPressed: () {
            context.goNamed(AppRoutes.addExp);
          },
        ),
        AppUtils.mediumGap,
        Text(
          "List of Experiments",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Expanded(
            child: Center(
          child: Text("Report"),
        ))
      ],
    );
  }
}
