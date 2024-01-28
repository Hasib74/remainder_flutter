import 'package:flutter/material.dart';
import 'package:filednote/core/theme/app_colors.dart';
import 'package:filednote/presentation/addRemainder/screen/sections/frequency.dart';
import 'package:filednote/presentation/addRemainder/screen/sections/select_day.dart';

class AddRemainderScreen extends StatelessWidget {
  const AddRemainderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _topBar(context),
            const Frequency(),
            SelectDays(),
          ],
        ),
      ),
    );
  }

  _topBar(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius:
              const BorderRadius.only(bottomRight: Radius.circular(15))),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          Text(
            "Add Remainder",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: AppColor.whiteColor),
          ),
        ],
      ),
    );
  }
}
