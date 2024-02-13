import 'package:filednote/core/mixin/state_mixin.dart';
import 'package:filednote/core/snackbar/app_snack_bar.dart';
import 'package:filednote/presentation/auth/service/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../repository/auth_repository.dart';

class AuthController with StateMixin {
  BuildContext context;

  AuthRepository authService = AuthService();

  AuthController(this.context);

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController emailAddressController = TextEditingController();

  TextEditingController instituteNameController = TextEditingController();

  TextEditingController designationController = TextEditingController();

  @override
  dispose() {
    emailController.dispose();
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
    emailController.clear();
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
    if (emailAddressController.value.text.isEmpty) {
      AppSnackBar.showErrorSnackBar(context, 'Email is required');

      return;
    }

    if (passwordController.value.text.isEmpty) {
      AppSnackBar.showErrorSnackBar(context, 'Password is required');
      return;
    }

    Map<String, String> body = {
      'username ': emailAddressController.value.text,
      'password': passwordController.value.text
    };

    EasyLoading.show(status: 'loading...');

    print("Auth service => ${authService}");

    await authService.signInWithEmailAndPassword(body);

    EasyLoading.dismiss();
  }

  Future<void> signUpWithEmailAndPassword(Map<String, String> body) async {
    EasyLoading.show(status: 'loading...');
    await authService.signUpWithEmailAndPassword(body);
    EasyLoading.dismiss();
  }

  Future<void> signOut() async {
    await authService.signOut();
  }
}
