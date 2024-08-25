import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/bloc/weather/weather_bloc.dart';
import 'package:flutter_weather_app/services/weather_service.dart';
import 'package:mocktail/mocktail.dart';

import '../mock/mock_hydrated_bloc.dart';
import '../mock/mock_setups.dart';
import '../mock/mock_weather_models.dart';

class MockWeatherService extends Mock implements WeatherService {}

void main() {
  initHydratedBloc();

  group('Weather Feature Testing', () {
    final mockService = MockWeatherService();

    final today = MockWeatherModels.setToday();
    final weekly = MockWeatherModels.setWeekly();

    blocTest<WeatherBloc, WeatherState>(
      'success: GetWeatherDetailsEvent',
      setUp: () {
        MockWeatherSetup.successGetWeather(mockService);
        MockWeatherSetup.successGetWeatherToday(mockService);
      },
      build: () => WeatherBloc(mockService),
      act: (bloc) => bloc.add(GetWeatherDetailsEvent()),
      skip: 1,
      expect: () => <WeatherState>[
        WeatherDataFetched(weatherToday: today, weatherWeekly: weekly)
      ],
    );

    blocTest<WeatherBloc, WeatherState>(
      'failed: GetWeatherDetailsEvent, should use Hydrated Bloc as backup data',
      setUp: () {
        MockWeatherSetup.failedGetWeather(mockService);
        MockWeatherSetup.failedGetWeatherToday(mockService);
      },
      build: () => WeatherBloc(mockService),
      act: (bloc) => bloc.add(GetWeatherDetailsEvent()),
      skip: 1,
      expect: () => <WeatherState>[
        WeatherDataFetched(weatherToday: today, weatherWeekly: weekly)
      ],
    );
  });
}
