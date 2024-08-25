import 'package:flutter/material.dart';
import 'package:flutter_weather_app/constants/colors.dart';
import 'package:flutter_weather_app/constants/textstyles.dart';
import 'package:flutter_weather_app/features/weather/weather_per_hour_tile.dart';
import 'package:flutter_weather_app/models/weather_today_model.dart';
import 'package:flutter_weather_app/utils/app_weather_code_prettify.dart';

class WeatherToday extends StatefulWidget {
  const WeatherToday({super.key, required this.weather});

  final WeatherTodayModel weather;

  @override
  State<WeatherToday> createState() => _WeatherTodayState();
}

class _WeatherTodayState extends State<WeatherToday> {
  bool showPerHour = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.background,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                height: 80,
                child: Image.asset(
                  WeatherCodePrettify.getImageAsset(
                    widget.weather.weatherCode.first,
                    DateTime.now().toString(),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${widget.weather.temp.first}°',
                    style: AppText.feature,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    width: 180,
                    child: Text(
                      WeatherCodePrettify.getDescription(
                        widget.weather.weatherCode.first,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  )
                ],
              ),
            ],
          ),
          if (showPerHour)
            Container(
              margin: const EdgeInsets.only(top: 30),
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.weather.time.length,
                itemBuilder: (context, i) {
                  return WeatherPerHourTile(weather: widget.weather, index: i);
                },
              ),
            ),
          GestureDetector(
            onTap: () {
              showPerHour = !showPerHour;
              setState(() {});
            },
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  showPerHour ? 'Hide Details' : "Show More Details",
                  style: TextStyle(
                    color: showPerHour ? AppColor.disable : AppColor.highlight,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
