import 'package:flutter/material.dart';
import 'package:flutter_weather_app/bloc/weather/weather_bloc.dart';
import 'package:flutter_weather_app/components/gradient_container.dart';
import 'package:flutter_weather_app/features/weather/weather_this_week.dart';
import 'package:flutter_weather_app/features/weather/weather_today.dart';
import 'package:flutter_weather_app/models/weather_model.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({
    super.key,
    required this.weather,
    required this.bloc,
  });

  final WeatherDailyModel weather;
  final WeatherBloc bloc;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfff2f8f9),
        title: const Text(
          'Weather Forecast',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: GradientContainer(
          child: Column(
            children: [
              WeatherToday(weather: widget.weather),
              WeatherThisWeek(weather: widget.weather)
            ],
          ),
        ),
      ),
    );
  }
}
