import 'dart:convert';

import 'package:flutter_weather_app/models/weather_model.dart';
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

  Future<dynamic> getWeatherDaily() async {
    await initialize();
    return preferences!.get('weather_daily');
  }

  Future<dynamic> setWeatherDaily(WeatherDailyModel weather) async {
    await initialize();
    return preferences!.setString('weather_daily', jsonEncode(weather));
  }

  Future<dynamic> removeWeatherDaily() async {
    await initialize();
    return preferences!.remove('weather_daily');
  }

  Future<void> clearUserPreferences() async {
    await initialize();
  }
}
