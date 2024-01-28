import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:filednote/core/theme/app_colors.dart';
import 'package:filednote/presentation/addRemainder/enum/frequency_enum.dart';

import '../../provider/freequency_provider.dart';

class Frequency extends ConsumerWidget {
  const Frequency({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: FrequencyEnum.getFrequencyList().map((e) {
          return InkWell(
            onTap: () {
              ref.read(frequencyProvider.notifier).state = e;
            },
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ref.watch(frequencyProvider) == e
                      ? AppColor.secondaryColor
                      : AppColor.grayColor,
                ),
                child: Center(
                  child: Text(
                    e.getString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ref.watch(frequencyProvider) == e
                          ? AppColor.whiteColor
                          : AppColor.primaryTextColor,
                    ),
                  ),
                )),
          );
        }).toList(),
      ),
    );
  }
}
