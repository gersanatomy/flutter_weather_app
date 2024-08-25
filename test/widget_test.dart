// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/features/weather/weather_route.dart';

import 'package:flutter_weather_app/main.dart';

void main() {
  testWidgets('Splash screen should diplay while api is fetching',
      (WidgetTester tester) async {
    await tester.pumpWidget(const WeatherAppRoute());

    expect(find.text('Weather'), findsOneWidget);
    expect(find.text('Forecast'), findsOneWidget);
    expect(find.text(''), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
