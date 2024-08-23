import 'package:flutter/material.dart';
import 'package:flutter_weather_app/components/gradient_container.dart';
import 'package:flutter_weather_app/components/spaced_column.dart';
import 'package:flutter_weather_app/features/weather/weather_header.dart';
import 'package:flutter_weather_app/features/weather/weather_list_tile.dart';
import 'package:flutter_weather_app/models/weather_model.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key, required this.weatherDailyModel});

  final WeatherDailyModel weatherDailyModel;

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
        physics: const NeverScrollableScrollPhysics(),
        child: GradientContainer(
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
