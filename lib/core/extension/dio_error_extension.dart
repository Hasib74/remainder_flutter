import 'dart:io';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dio/dio.dart';
import 'package:filednote/core/global/global_data.dart';
import 'package:flutter/cupertino.dart';

extension DioErrorExtension on DioExceptionType {
  String get errorMessage {
    switch (this) {
      case DioExceptionType.cancel:
        return "Request to API server was cancelled";
      case DioExceptionType.connectionTimeout:
        return "Connection timeout with API server";
      case DioExceptionType.unknown:
        return "Connection to API server failed due to internet connection";
      case DioExceptionType.receiveTimeout:
        return "Receive timeout in connection with API server";

      case DioExceptionType.sendTimeout:
        return "Send timeout in connection with API server";
      default:
        return "Something went wrong";
    }
  }

  showMessage() {
    if (AppGlobalData().snackBarKey.currentContext == null) {
      return;
    }
    AnimatedSnackBar.material(errorMessage,
            type: AnimatedSnackBarType.error,
            duration: const Duration(seconds: 2))
        .show(AppGlobalData().snackBarKey.currentContext!);
  }
}


extension SocketExceptionExtension on SocketException {
  showMessage() {
    if (AppGlobalData().snackBarKey.currentContext == null) {
      return;
    }
    AnimatedSnackBar.material(message,
            type: AnimatedSnackBarType.error,
            duration: const Duration(seconds: 2))
        .show(AppGlobalData().snackBarKey.currentContext!);
  }
}
