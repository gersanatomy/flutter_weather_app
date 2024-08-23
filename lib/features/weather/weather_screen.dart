import 'package:flutter/material.dart';
import 'package:flutter_weather_app/components/spaced_column.dart';
import 'package:flutter_weather_app/features/weather/weather_header.dart';
import 'package:flutter_weather_app/features/weather/weather_list_tile.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

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
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xff7095b3),
                Color(0xff7f94b7),
                Color(0xff8b92ba),
              ],
            ),
          ),
          child: SpacedColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WeatherHeader(),
              Container(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, i) {
                    return const WeatherListTile();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
