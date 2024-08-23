import 'package:flutter_weather_app/apis/weather_api.dart';

class WeatherService {
  Future<void> getWeatherForecast() async {
    Map<String, String> query = {
      "latitude": "",
      "longitude": "",
      "daily": "sunrise, sunset"
    };

    final res = await WeatherApi().getWeatherForecast(query);

    print('res: $res');
  }
}
