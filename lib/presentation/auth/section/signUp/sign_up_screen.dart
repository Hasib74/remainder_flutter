import 'package:filednote/core/widgets/app_button_widgets.dart';
import 'package:flutter/material.dart';

import '../../../../core/utls/app_utls.dart';
import '../../../../core/widgets/app_text_filed.dart';
import '../../../../l10n/language.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppUtils.largeGap,
          AppUtils.logo,
          AppUtils.largeGap,
          AppTextFiled(
            hint: language(context)!.name,
            textInputType: TextInputType.emailAddress,
            controller: TextEditingController(),
            validator: (value) {
              if (value!.isEmpty) {}
              return null;
            },
          ),
          AppUtils.smallGap,
          AppTextFiled(
            hint: language(context)!.mobile,
            textInputType: TextInputType.emailAddress,
            controller: TextEditingController(),
            validator: (value) {
              if (value!.isEmpty) {}
              return null;
            },
          ),
          AppUtils.smallGap,
          AppTextFiled(
            hint: language(context)!.email,
            textInputType: TextInputType.emailAddress,
            controller: TextEditingController(),
            validator: (value) {
              if (value!.isEmpty) {}
              return null;
            },
          ),
          AppUtils.smallGap,
          AppTextFiled(
            hint: language(context)!.institute_or_university,
            textInputType: TextInputType.text,
            controller: TextEditingController(),
            validator: (value) {
              if (value!.isEmpty) {}
              return null;
            },
          ),
          AppUtils.smallGap,
          AppTextFiled(
            hint: language(context)!.designation,
            textInputType: TextInputType.text,
            controller: TextEditingController(),
            validator: (value) {
              if (value!.isEmpty) {}
              return null;
            },
          ),
          AppUtils.smallGap,
          AppTextFiled(
            hint: language(context)!.password,
            textInputType: TextInputType.text,
            controller: TextEditingController(),
            validator: (value) {
              if (value!.isEmpty) {}
              return null;
            },
          ),
          AppUtils.largeGap,
          AppButton(
            title: language(context)!.signUp,
            onPressed: () {},
          ),
          AppUtils.largeGap,
        ],
      ),
    );
  }
}
