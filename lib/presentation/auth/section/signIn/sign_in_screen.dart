import 'package:filednote/core/route/app_routes.dart';
import 'package:filednote/core/widgets/app_button_widgets.dart';
import 'package:filednote/generated/assets.dart';
import 'package:filednote/presentation/auth/controller/auth_controller.dart';
import 'package:filednote/presentation/auth/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/snackbar/app_snack_bar.dart';
import '../../../../core/utls/app_utls.dart';
import '../../../../core/widgets/app_text_filed.dart';
import '../../../../l10n/language.dart';
import '../../repository/auth_repository.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  AuthController? authController;

  @override
  Widget build(BuildContext context) {
    authController = AuthController(context);

    return Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: authController?.signInFormKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppUtils.largeGap,
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
                  controller: authController?.emailAddressController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email or Mobile is required";
                    }
                  },
                ),
                AppUtils.mediumGap,
                AppTextFiled(
                  maxLines: 1,
                  obscureText: true,
                  hint: language(context)!.password,
                  textInputType: TextInputType.text,
                  controller: authController?.passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password is required";
                    }
                  },
                ),
                AppUtils.largeGap,
                AppButton(
                  title: language(context)!.signIn,
                  onPressed: () async {
                    //      context.goNamed(AppRoutes.dashBoard);

                    bool? isSuccess = await authController
                        ?.signInWithEmailAndPassword(context);

                    if (isSuccess == true) {
                      context.pushReplacementNamed(AppRoutes.dashBoard);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
