import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:filednote/core/widgets/app_button_widgets.dart';
import 'package:filednote/presentation/addRemainder/enum/days.dart';

import '../../../../core/theme/app_colors.dart';
import '../../provider/selected_day_provider.dart';

class SelectDays extends ConsumerWidget {
  const SelectDays({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Select Day",
              style: Theme.of(context).textTheme.titleMedium),
        ),
        SizedBox(
          height: 30,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0),
            child: ListView.custom(
              padding: EdgeInsets.symmetric(vertical: 2),
              scrollDirection: Axis.horizontal,
              childrenDelegate: SliverChildBuilderDelegate((context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: AppButton(
                    height: 10,
                    color: ref.watch(selectedDaysProvider) ==
                            DaysEnum.getDaysList()[index]
                        ? AppColor.secondaryColor
                        : AppColor.grayColor,
                    textColor: ref.watch(selectedDaysProvider) ==
                            DaysEnum.getDaysList()[index]
                        ? AppColor.whiteColor
                        : AppColor.primaryTextColor,
                    fontSize: 12,
                    // height: 25,
                    title: DaysEnum.getDaysList()[index].name,
                    onPressed: () {
                      ref.read(selectedDaysProvider.notifier).state =
                          DaysEnum.getDaysList()[index];

                      if (kDebugMode) {
                        print(DaysEnum.getDaysList()[index]);
                      }
                    },
                  ),
                );
              }, childCount: DaysEnum.getDaysList().length),
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
            ),
          ),
        )
      ],
    );
  }
}
