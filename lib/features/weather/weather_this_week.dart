import 'package:flutter/material.dart';
import 'package:flutter_weather_app/features/weather/weather_list_tile.dart';
import 'package:flutter_weather_app/models/weather_model.dart';

class WeatherThisWeek extends StatelessWidget {
  const WeatherThisWeek({
    super.key,
    required this.weather,
  });

  final WeatherDailyModel weather;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            margin: const EdgeInsets.only(left: 20, top: 10),
            child: const Text(
              'This Week',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
          Container(
            height: 30,
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(
              right: 50,
            ),
            child: const Text(
              'High | Low',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: weather.time.length,
              itemBuilder: (context, i) {
                return WeatherListTile(weather: weather, index: i);
              },
            ),
          ),
        ],
      ),
    );
  }
}
