import 'package:mocktail/mocktail.dart';
import '../unit_testing/weather_bloc_unit_test.dart';
import 'mock_weather_models.dart';

class MockWeatherSetup {
  static successGetWeatherToday(MockWeatherService service) {
    return when(() => service.getWeatherTodayForecast())
        .thenAnswer((_) => Future.value(MockWeatherModels.getToday()));
  }

  static successGetWeather(MockWeatherService service) {
    return when(() => service.getWeatherForecast())
        .thenAnswer((_) => Future.value(MockWeatherModels.getWeekly()));
  }

  static failedGetWeatherToday(MockWeatherService service) {
    return when(() => service.getWeatherTodayForecast())
        .thenAnswer((_) => Future.value(MockWeatherModels.getToday()));
  }

  static failedGetWeather(MockWeatherService service) {
    return when(() => service.getWeatherForecast())
        .thenAnswer((_) => throw Error());
  }
}
