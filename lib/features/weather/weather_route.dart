import 'package:flutter/material.dart';
import 'package:flutter_weather_app/services/weather_service.dart';

class WeatherAppRoute extends StatefulWidget {
  const WeatherAppRoute({super.key});

  @override
  State<WeatherAppRoute> createState() => _WeatherAppRouteState();
}

class _WeatherAppRouteState extends State<WeatherAppRoute> {
  @override
  void initState() {
    super.initState();
    WeatherService().getWeatherForecast();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
          // child: ,
          ),
    );
  }
}
