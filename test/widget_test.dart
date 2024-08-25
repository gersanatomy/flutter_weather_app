// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/bloc/weather/weather_bloc.dart';
import 'package:flutter_weather_app/features/splash/splash_screen.dart';
import 'package:flutter_weather_app/features/weather/weather_screen.dart';

import 'mock/mock_hydrated_bloc.dart';
import 'mock/mock_weather_models.dart';
import 'unit_testing/weather_bloc_unit_test.mocks.dart';

Widget makeTestableWidget(Widget child) {
  return MaterialApp(
    home: BlocBuilder<WeatherBloc, WeatherState>(
      bloc: WeatherBloc(MockWeatherService())..add(GetWeatherDetailsEvent()),
      builder: (context, state) {
        return child;
      },
    ),
  );
}

void main() {
  initHydratedBloc();

  group('Find Elements', () {
    final today = MockWeatherModels.setToday();
    final weekly = MockWeatherModels.setWeekly();
    final mockService = MockWeatherService();
    final weatherbloc = WeatherBloc(mockService);

    testWidgets('Find splash screen elements successfully',
        (WidgetTester tester) async {
      SplashScreen splashPage = const SplashScreen();

      await tester.pumpWidget(makeTestableWidget(splashPage));

      expect(find.byKey(const Key('splash')), findsOneWidget);
      expect(find.text('Weather'), findsOneWidget);
      expect(find.text('Forecast'), findsOneWidget);
    });
  });
}
