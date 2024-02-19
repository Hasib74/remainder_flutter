import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:filednote/core/global/global_data.dart';
import 'package:filednote/core/snackbar/app_snack_bar.dart';

extension DioResponseExtension on Response {
  showStatusMessage() {
    if (statusCode == 200) {
      return;
    }
    if (statusCode == 401) {
      AppSnackBar.showErrorSnackBar(
          context: AppGlobalData().snackBarKey.currentState!.context,
          message: jsonDecode(data)["details"] ?? "Unauthorised");
      return;
    }
    if (statusCode == 403) {
      AppSnackBar.showErrorSnackBar(
          context: AppGlobalData().snackBarKey.currentState!.context,
          message: jsonDecode(data)["details"] ?? "Forbidden");
      return;
    }
    if (statusCode == 404) {
      AppSnackBar.showErrorSnackBar(
          context: AppGlobalData().snackBarKey.currentState!.context,
          message: jsonDecode(data)["details"] ?? "Not Found");

      return;
    }
    if (statusCode == 500) {
      AppSnackBar.showErrorSnackBar(
          context: AppGlobalData().snackBarKey.currentState!.context,
          message: jsonDecode(data)["details"] ?? "Internal Server Error");
      return;
    }

    print("status code : $statusCode && ${jsonDecode(data)["details"]}");

    AppSnackBar.showErrorSnackBar(

        context: AppGlobalData().snackBarKey.currentState!.context,
        message: jsonDecode(data)["details"] ?? "Something went wrong");
  }
}
