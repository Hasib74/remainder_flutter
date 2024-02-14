import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AppLoadingWidget {
  static showLoadingDialog(BuildContext context) {
    EasyLoading.show(status: 'loading...');
  }

  static hideLoadingDialog() {
    EasyLoading.dismiss();
  }
}
