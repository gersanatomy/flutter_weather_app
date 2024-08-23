import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/weather_model.dart';

class WeatherToday extends StatelessWidget {
  const WeatherToday({super.key, required this.weather});

  final WeatherDailyModel weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: const Color(0xfff2f8f9),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 120,
            child: Image.asset('assets/cloudy.png'),
          ),
          const Column(
            children: [
              Text(
                '36°',
                style: TextStyle(fontSize: 40),
              ),
              Text('Partly Cloudy')
            ],
          ),
        ],
      ),
    );
  }
}
