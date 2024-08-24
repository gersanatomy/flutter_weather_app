import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/weather_today_model.dart';
import 'package:flutter_weather_app/utils/app_date_prettify.dart';
import 'package:flutter_weather_app/utils/app_weather_code_prettify.dart';

class WeatherPerHourTile extends StatelessWidget {
  const WeatherPerHourTile(
      {super.key, required this.weather, required this.index});

  final WeatherTodayModel weather;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Text(
            DatePrettify.timeToString(weather.time[index]),
            style: TextStyle(color: Colors.grey[400]),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: 30,
            child: Image.asset(
              WeatherCodePrettify.getImageAsset(
                  weather.weatherCode[index], weather.time[index]),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              '${weather.temp[index]}°',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
