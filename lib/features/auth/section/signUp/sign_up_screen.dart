import 'package:filednote/core/snackbar/app_snack_bar.dart';
import 'package:filednote/core/widgets/app_button_widgets.dart';
import 'package:flutter/material.dart';

import '../../../../core/utls/app_utls.dart';
import '../../../../core/widgets/app_text_filed.dart';
import '../../../../l10n/language.dart';
import '../../controller/auth_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  late AuthController authController;

  @override
  Widget build(BuildContext context) {
    authController = AuthController(context);

    return SingleChildScrollView(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: authController.regFormKey,
        child: Column(
          children: [
            AppUtils.largeGap,
            AppUtils.logo,
            AppUtils.largeGap,
            AppTextFiled(
              hint: language(context)!.name,
              textInputType: TextInputType.emailAddress,
              controller: authController.nameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Name is required";
                }
              },
            ),
            AppUtils.smallGap,
            AppTextFiled(
              hint: language(context)!.mobile,
              textInputType: TextInputType.phone,
              controller: authController.phoneController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Mobile is required";
                }
              },
            ),
            AppUtils.smallGap,
            AppTextFiled(
              hint: language(context)!.email,
              textInputType: TextInputType.emailAddress,
              controller: authController.emailAddressController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Email is required";
                }
              },
            ),
            AppUtils.smallGap,
            AppTextFiled(
              hint: language(context)!.institute_or_university,
              textInputType: TextInputType.text,
              controller: authController.instituteNameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Institute or University is required";
                }
              },
            ),
            AppUtils.smallGap,
            AppTextFiled(
              hint: language(context)!.designation,
              textInputType: TextInputType.text,
              controller: authController.designationController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Designation is required";
                }
              },
            ),
            AppUtils.smallGap,
            AppTextFiled(
              obscureText: true,
              hint: language(context)!.password,
              textInputType: TextInputType.text,
              controller: authController.passwordController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Password is required";
                }
              },
            ),
            AppUtils.largeGap,
            AppButton(
              title: language(context)!.signUp,
              onPressed: () {
                authController.signUpWithEmailAndPassword();
              },
            ),
            AppUtils.largeGap,
          ],
        ),
      ),
    );
  }
}
