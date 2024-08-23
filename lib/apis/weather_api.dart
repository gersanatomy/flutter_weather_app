import 'package:flutter_weather_app/apis/api_request.dart';

class WeatherApi extends ApiRequest {
  Future<dynamic> getWeatherForecast(Map<String, String> query) {
    return get('/v1/forecast', query);
  }
}
