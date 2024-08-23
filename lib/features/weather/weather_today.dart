import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/weather_today_model.dart';
import 'package:flutter_weather_app/utils/app_date_prettify.dart';

class WeatherToday extends StatelessWidget {
  const WeatherToday({super.key, required this.weather, required this.address});

  final WeatherTodayModel weather;
  final List<String> address;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: const Color(0xfff2f8f9),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            address.first,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          Text(
            DatePrettify.weekdayMonthDayToString(DateTime.now()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
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
        ],
      ),
    );
  }
}
