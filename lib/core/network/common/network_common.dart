import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/auth/provider/auth_provider.dart';

class AppNetworkCommon {
  static Future<Map<String, String>> header()  async {
    var token = await  ProviderContainer().read(authTokenProvider.notifier).getToken();

    return {"Authorization": "Bearer $token"};
  }
}
