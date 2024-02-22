import 'package:filednote/core/route/app_routes.dart';
import 'package:filednote/core/theme/app_colors.dart';
import 'package:filednote/presentation/crops/presentation/controller/crops_controller.dart';
import 'package:filednote/presentation/crops/presentation/provider/crops_list_providers.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashBoardScreen extends HookConsumerWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CropsController? cropsController = CropsController();
    cropsController.getAllCrops(context, ref);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Card(
                      child: _verticalListTile(context,
                          title: "Experiments", value: "12"),
                    ),
                  ),
                  Gap(16),
                  Expanded(
                    child: Card(
                      child: InkWell(
                        onTap: () {
                          context.push(AppRoutes.desease);
                        },
                        child: _verticalListTile(context,
                            title: "Disease", value: "200"),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(16),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      child: _verticalListTile(context,
                          title: "Workers/Student", value: "250"),
                    ),
                  ),
                  Gap(16),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        context.goNamed(AppRoutes.cropsList);
                      },
                      child: Card(
                        child: _verticalListTile(context,
                            title: "Crops", value: "12"),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(16),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 100,
                      child: Card(
                        child: Center(
                            child: Text(
                          "Record Data",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.w500),
                        )),
                      ),
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    child: SizedBox(
                      height: 100,
                      child: Card(
                        child: Center(
                          child: Text("Analysis Tools",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _verticalListTile(BuildContext context,
      {required String title, required String value}) {
    return SizedBox(
      height: 100,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            Gap(16),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
