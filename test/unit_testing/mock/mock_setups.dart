import 'package:mocktail/mocktail.dart';
import '../weather_bloc_unit_test.dart';
import 'mock_weather_models.dart';

class MockWeatherSetup {
  static successGetWeatherToday(MockWeatherService service) {
    return when(() => service.getWeatherTodayForecast())
        .thenAnswer((_) => Future(MockWeatherModels.getToday()));
  }

  static successGetWeather(MockWeatherService service) {
    return when(() => service.getWeatherForecast())
        .thenAnswer((_) => Future(MockWeatherModels.getWeekly()));
  }

  static failedGetWeatherToday(MockWeatherService service) {
    return when(() => service.getWeatherTodayForecast())
        .thenAnswer((_) => throw Error());
  }

  static failedGetWeather(MockWeatherService service) {
    return when(() => service.getWeatherForecast())
        .thenAnswer((_) => throw Error());
  }
}
