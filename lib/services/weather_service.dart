import 'package:flutter_weather_app/apis/weather_api.dart';
import 'package:flutter_weather_app/utils/app_date_prettify.dart';
import 'package:flutter_weather_app/utils/app_geolocator.dart';
import 'package:geolocator/geolocator.dart';

class WeatherService {
  Future<dynamic> getWeatherTodayForecast() async {
    Position? position = await AppGeoLocator.getUserCoordinates();

    String today = DatePrettify.dateToString(DateTime.now());

    Map<String, String> query = {
      "latitude": position?.latitude.toString() ?? '',
      "longitude": position?.longitude.toString() ?? '',
      "hourly": "temperature_2m,weather_code",
      "start_date": today,
      "end_date": today,
    };

    var res = await WeatherApi().getWeatherForecast(query);

    res['hourly']['address'] = await AppGeoLocator.getCityProvince();

    return res;
  }

  Future<dynamic> getWeatherForecast() async {
    Position? position = await AppGeoLocator.getUserCoordinates();

    DateTime now = DateTime.now();
    final endOfweek = DateTime(now.year, now.month, now.day + 7);

    Map<String, String> query = {
      "latitude": position?.latitude.toString() ?? '',
      "longitude": position?.longitude.toString() ?? '',
      "start_date": DatePrettify.dateToString(now),
      "end_date": DatePrettify.dateToString(endOfweek),
      "daily":
          "temperature_2m_max,temperature_2m_min,sunrise,sunset,weather_code,precipitation_hours"
    };

    var res = await WeatherApi().getWeatherForecast(query);

    return res;
  }
}
