import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

var authTokenProvider =
    StateNotifierProvider<AuthTokenProvider, String?>((ref) {
  return AuthTokenProvider();
});

class AuthTokenProvider extends StateNotifier<String?> {
  AuthTokenProvider() : super(null);

  void setToken(String? token) async {
    await SharedPreferences.getInstance().then((prefs) {
      prefs.setString('token', token!);
    });
    state = token;
  }

  void removeToken() async {
    await SharedPreferences.getInstance().then((prefs) {
      prefs.remove('token');
    });
    state = null;
  }

  Future<String?>? getToken() async {
    await SharedPreferences.getInstance().then((prefs) {
      state = prefs.getString('token');
    });

    print("State Token => ${state}");
    return state;
  }

  String? get token => state;
}
