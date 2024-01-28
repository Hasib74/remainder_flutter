import 'package:filednote/core/route/app_routes.dart';
import 'package:filednote/core/widgets/app_button_widgets.dart';
import 'package:filednote/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utls/app_utls.dart';
import '../../../../core/widgets/app_text_filed.dart';
import '../../../../l10n/language.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppUtils.largeGap,
            AppUtils.logo,
            AppUtils.largeGap,
            Text(
              language(context)!.welcome,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
              textAlign: TextAlign.center,
            ),
            AppUtils.largeGap,
            AppTextFiled(
              hint: language(context)!.emailOrMobile,
              textInputType: TextInputType.emailAddress,
              controller: TextEditingController(),
              validator: (value) {
                if (value!.isEmpty) {}
                return null;
              },
            ),
            AppUtils.mediumGap,
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
              title: language(context)!.signIn,
              onPressed: () {
                context.goNamed(AppRoutes.dashBoard);
              },
            )
          ],
        ),
      ),
    );
  }
}
