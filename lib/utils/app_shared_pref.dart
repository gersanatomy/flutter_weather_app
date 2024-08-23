import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPreferences? preferences;

  Future<void> initialize() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<void> initializeWithTimeout() async {
    preferences =
        await SharedPreferences.getInstance().timeout(Duration(seconds: 1));
  }

  Future<dynamic> getAccessToken() async {
    await initialize();
    return preferences!.getString('access_token');
  }

  Future<dynamic> setAccessToken(String accessToken) async {
    await initialize();
    return preferences!.setString('access_token', accessToken);
  }

  Future<dynamic> removeAccessToken() async {
    await initialize();
    return preferences!.remove('access_token');
  }

  Future<void> clearUserPreferences() async {
    await initialize();
  }
}
