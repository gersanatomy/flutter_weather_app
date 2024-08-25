import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/bloc/weather/weather_bloc.dart';
import 'package:flutter_weather_app/services/weather_service.dart';
import 'package:mocktail/mocktail.dart';

import 'mock/mock_hydrated_bloc.dart';
import 'mock/mock_setups.dart';

class MockWeatherService extends Mock implements WeatherService {}

void main() {
  initHydratedBloc();

  group('Weather Feature', () {
    final mockService = MockWeatherService();
    late WeatherBloc weatherBloc;

    setUp(() {
      weatherBloc = WeatherBloc(mockService);
    });

    test('Emits [InitialWeatherState] correctly', () {
      expect(weatherBloc.state, InitialWeatherState());
    });

    blocTest<WeatherBloc, WeatherState>(
      'Emits [WeatherDataFetched] from service',
      setUp: () {
        MockWeatherSetup.successGetWeather(mockService);
        MockWeatherSetup.successGetWeatherToday(mockService);
      },
      build: () => weatherBloc,
      act: (bloc) => bloc.add(GetWeatherDetailsEvent()),
      skip: 1,
      expect: () => [isA<WeatherDataFetched>()],
    );

    blocTest<WeatherBloc, WeatherState>(
      'Emits [WeatherDataFetched] with data from local storage',
      setUp: () {
        MockWeatherSetup.successGetWeather(mockService);
        MockWeatherSetup.failedGetWeatherToday(mockService);
      },
      build: () => WeatherBloc(mockService),
      act: (bloc) => bloc.add(GetWeatherDetailsEvent()),
      skip: 1,
      expect: () => [isA<WeatherDataFetched>()],
    );

    blocTest<WeatherBloc, WeatherState>(
      'Emits [WeatherDataEmpty] when both from api and local storage fails',
      setUp: () {
        MockWeatherSetup.failedGetWeather(mockService);
        MockWeatherSetup.failedGetWeatherToday(mockService);
      },
      build: () => WeatherBloc(mockService),
      act: (bloc) => bloc.add(GetWeatherDetailsEvent()),
      skip: 1,
      expect: () => [isA<WeatherDataEmpty>()],
    );
  });
}
