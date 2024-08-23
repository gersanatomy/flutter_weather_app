import 'dart:convert';

import 'package:flutter_weather_app/models/weather_model.dart';
import 'package:flutter_weather_app/models/weather_today_model.dart';
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

  Future<dynamic> getWeatherWeekly() async {
    await initialize();
    return preferences!.get('weather_daily');
  }

  Future<dynamic> setWeatherWeekly(WeatherDailyModel weather) async {
    await initialize();
    return preferences!.setString('weather_daily', jsonEncode(weather));
  }

  Future<dynamic> removeWeatherWeekly() async {
    await initialize();
    return preferences!.remove('weather_daily');
  }

  Future<dynamic> getWeatherToday() async {
    await initialize();
    return preferences!.get('weather_today');
  }

  Future<dynamic> setWeatherToday(WeatherTodayModel weather) async {
    await initialize();
    return preferences!.setString('weather_today', jsonEncode(weather));
  }

  Future<dynamic> removeWeatherToday() async {
    await initialize();
    return preferences!.remove('weather_today');
  }

  Future<void> clearUserPreferences() async {
    await initialize();
  }
}
