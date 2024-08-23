import 'package:flutter_weather_app/apis/weather_api.dart';
import 'package:flutter_weather_app/utils/app_geolocator.dart';
import 'package:geolocator/geolocator.dart';

class WeatherService {
  Future<void> getWeatherForecast() async {
    Position? position = await AppGeoLocator.getUserCoordinates();

    Map<String, String> query = {
      "latitude": position?.latitude.toString() ?? '',
      "longitude": position?.longitude.toString() ?? '',
      "daily":
          "temperature_2m_max,temperature_2m_min,sunrise,sunset,weather_code,precipitation_hours"
    };

    final res = await WeatherApi().getWeatherForecast(query);
  }
}
