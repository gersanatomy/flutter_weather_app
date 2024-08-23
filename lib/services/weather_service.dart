import 'package:flutter_weather_app/apis/weather_api.dart';
import 'package:flutter_weather_app/utils/app_date_prettify.dart';
import 'package:flutter_weather_app/utils/app_geolocator.dart';
import 'package:geolocator/geolocator.dart';

class WeatherService {
  Future<dynamic> getWeatherTodayForecast() async {
    Position? position = await AppGeoLocator.getUserCoordinates();

    Map<String, String> query = {
      "latitude": position?.latitude.toString() ?? '',
      "longitude": position?.longitude.toString() ?? '',
      "hourly": "temperature_2m,weather_code",
      "start_date": DatePrettify.dateToString(DateTime.now()),
      "end_date": DatePrettify.dateToString(DateTime.now()),
    };

    var res = await WeatherApi().getWeatherForecast(query);

    return res;
  }

  Future<dynamic> getWeatherForecast() async {
    Position? position = await AppGeoLocator.getUserCoordinates();

    Map<String, String> query = {
      "latitude": position?.latitude.toString() ?? '',
      "longitude": position?.longitude.toString() ?? '',
      "daily":
          "temperature_2m_max,temperature_2m_min,sunrise,sunset,weather_code,precipitation_hours"
    };

    var res = await WeatherApi().getWeatherForecast(query);

    return res;
  }
}
