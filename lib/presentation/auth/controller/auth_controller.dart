import 'package:filednote/core/mixin/state_mixin.dart';
import 'package:filednote/core/response/appResponse.dart';
import 'package:filednote/core/response/error.dart';
import 'package:filednote/core/snackbar/app_snack_bar.dart';
import 'package:filednote/core/widgets/app_loading_widgets.dart';
import 'package:filednote/presentation/auth/service/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fpdart/fpdart.dart';

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
  initState() {
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

  Future<void> signInWithEmailAndPassword() async {
    signInFormKey.currentState?.save();
    if (signInFormKey.currentState?.validate() ?? false) {
      Map<String, String> body = {
        'username ': emailAddressController.value.text,
        'password': passwordController.value.text
      };

      EasyLoading.show(status: 'loading...');

      await authService.signInWithEmailAndPassword(body);

      EasyLoading.dismiss();
    }
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
