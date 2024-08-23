import 'package:flutter_weather_app/apis/api_request.dart';

class WeatherApi extends ApiRequest {
  Future<dynamic> getWeather() {
    return get('/', {});
  }
}
