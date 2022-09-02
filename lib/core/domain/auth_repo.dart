import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  Future<void> saveToken({
    required String username,
    required String password,
  }) async {
    SharedPreferences preferences;
    preferences = await SharedPreferences.getInstance();
    await preferences.setString('username', username);
    await preferences.setString('password', password);
  }

  Future<List> getToken() async {
    SharedPreferences preferences;
    final List<String> data = [];
    preferences = await SharedPreferences.getInstance();
    data.add(preferences.getString('username')!);
    data.add(preferences.getString('password')!);
    return data;
  }
}
