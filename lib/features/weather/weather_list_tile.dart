import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/weather_model.dart';
import 'package:flutter_weather_app/utils/app_date_prettify.dart';
import 'package:flutter_weather_app/utils/app_weather_code_prettify.dart';

class WeatherListTile extends StatelessWidget {
  const WeatherListTile(
      {super.key, required this.weather, required this.index});

  final WeatherDailyModel weather;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          20, 10, 20, weather.time.length - 1 == index ? 150 : 0),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xff9599be),
              Color(0xff7f94b7),
              Color(0xff7b98b7),
            ],
          ),
          borderRadius: BorderRadius.circular(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              DatePrettify.dayAndDateToString(weather.time[index]),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 40,
            child: Image.asset(
              WeatherCodePrettify.getImageAsset(
                  weather.weatherCode[index], weather.time[index]),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30),
            child: Text(
              '${weather.tempMax[index]}°  |  ${weather.tempMin[index]}°',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  getWeatherAsset() {
    // switch(){}
  }
}
