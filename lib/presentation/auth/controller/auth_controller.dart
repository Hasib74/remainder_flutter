import 'dart:async';
import 'dart:convert';

import 'package:filednote/core/mixin/state_mixin.dart';
import 'package:filednote/core/response/appResponse.dart';
import 'package:filednote/core/response/error.dart';
import 'package:filednote/core/snackbar/app_snack_bar.dart';
import 'package:filednote/core/widgets/app_loading_widgets.dart';
import 'package:filednote/presentation/auth/service/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../provider/auth_provider.dart';
import '../repository/auth_repository.dart';

class AuthController with StateMixin {
  BuildContext context;

  AuthRepository authService = AuthService();

  AuthController(this.context);

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController emailAddressController = TextEditingController();

  TextEditingController instituteNameController = TextEditingController();

  TextEditingController designationController = TextEditingController();

  var regFormKey = GlobalKey<FormState>();

  var signInFormKey = GlobalKey<FormState>();

  @override
  dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    emailAddressController.dispose();
    instituteNameController.dispose();
    designationController.dispose();
  }

  @override
  initState(BuildContext context) {
    _clearData();
  }

  void _clearData() {
    passwordController.clear();
    confirmPasswordController.clear();
    nameController.clear();
    phoneController.clear();
    emailAddressController.clear();
    instituteNameController.clear();
    designationController.clear();
  }

  Future<void> signInWithGoogle() async {
    await authService.signInWithGoogle();
  }

  Future<void> signInWithFacebook() async {
    await authService.signInWithFacebook();
  }

  Future<void> signInWithApple() async {
    await authService.signInWithApple();
  }

  Future<bool> signInWithEmailAndPassword(BuildContext context) async {
    Completer<bool> completer = Completer<bool>();

    signInFormKey.currentState?.save();
    if (signInFormKey.currentState?.validate() ?? false) {
      Map<String, String> body = {
        'username': emailAddressController.value.text,
        'password': passwordController.value.text
      };

      EasyLoading.show(status: 'loading...');

      Either<AppError, AppResponse> res =
          await authService.signInWithEmailAndPassword(body);

      res.fold((l) {
        AppSnackBar.showErrorSnackBar(
            context: context, message: l.message ?? 'Login Failed');

        completer.complete(false);
      }, (r) {
        if (kDebugMode) {
          print(jsonEncode(r.data["access_token"]));
        }

        if (r.data["access_token"] != null) {
          ProviderContainer()
              .read(authTokenProvider.notifier)
              .setToken(r.data["access_token"]);

          ProviderContainer().read(authTokenProvider.notifier).getToken();

          completer.complete(true);
        }

        AppSnackBar.showSuccessSnackBar(
            context: context, message: 'Login Successful');
      });

      EasyLoading.dismiss();
    }

    return completer.future;
  }

  Future<void> signUpWithEmailAndPassword() async {
    print("Form validation : ${regFormKey.currentState?.validate()}");

    regFormKey.currentState?.save();

    if (regFormKey.currentState?.validate() ?? false) {
      Map<String, String> body = {
        "email": emailAddressController.value.text,
        "full_name": nameController.value.text,
        "is_active": "true",
        "is_verified": "true",
        "password": passwordController.value.text,
      };

      AppLoadingWidget.showLoadingDialog(context);

      Either<AppError, AppResponse> res =
          await authService.signUpWithEmailAndPassword(body);

      if (res.isRight()) {
        signInWithEmailAndPassword(context);
        AppSnackBar.showSuccessSnackBar(
            context: context, message: 'Registration Successful');
      } else {
        AppSnackBar.showErrorSnackBar(
            context: context, message: 'Registration Failed');
      }

      AppLoadingWidget.hideLoadingDialog();
    }
  }

  Future<void> signOut() async {
    await authService.signOut();
  }
}
