import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';

class AppSnackBar {
  static showErrorSnackBar(
      {required BuildContext context, required String message}) {
    AnimatedSnackBar.material(
      message,
      type: AnimatedSnackBarType.warning,
    ).show(context);
  }

  static showSuccessSnackBar(
      {required BuildContext context, required String message}) {
    AnimatedSnackBar.material(
      message,
      type: AnimatedSnackBarType.success,
    ).show(context);
  }
}
