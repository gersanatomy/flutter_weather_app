// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/features/splash/splash_screen.dart';
import 'package:flutter_weather_app/features/weather/weather_screen.dart';

import 'mock/mock_hydrated_bloc.dart';
import 'mock/mock_weather_models.dart';

Widget makeTestableWidget(Widget child) {
  return MaterialApp(
    home: child,
  );
}

void main() {
  initHydratedBloc();

  group('Find Elements', () {
    final today = MockWeatherModels.setToday();
    final weekly = MockWeatherModels.setWeekly();

    testWidgets('Find splash screen elements successfully',
        (WidgetTester tester) async {
      SplashScreen splashPage = const SplashScreen();

      await tester.pumpWidget(makeTestableWidget(splashPage));

      expect(find.byKey(const Key('splash')), findsOneWidget);
      expect(find.text('Weather'), findsOneWidget);
      expect(find.text('Forecast'), findsOneWidget);
    });

    testWidgets('Find weather screen elements successfully',
        (WidgetTester tester) async {
      WeatherScreen weatherPage = WeatherScreen(
        today: today,
        weekly: weekly,
      );

      await tester.pumpWidget(makeTestableWidget(weatherPage));

      expect(find.byKey(const Key('weathertoday')), findsOneWidget);
      expect(
        find.byKey(const Key('weatherthisweek')),
        findsOneWidget,
      );
    });
  });
}
