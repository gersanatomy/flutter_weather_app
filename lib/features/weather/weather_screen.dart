import 'package:flutter/material.dart';
import 'package:flutter_weather_app/components/gradient_container.dart';
import 'package:flutter_weather_app/constants/colors.dart';
import 'package:flutter_weather_app/constants/textstyles.dart';
import 'package:flutter_weather_app/features/weather/weather_this_week.dart';
import 'package:flutter_weather_app/features/weather/weather_today.dart';
import 'package:flutter_weather_app/models/weather_model.dart';
import 'package:flutter_weather_app/models/weather_today_model.dart';
import 'package:flutter_weather_app/utils/app_date_prettify.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({
    super.key,
    required this.today,
    required this.weekly,
  });

  final WeatherTodayModel today;
  final WeatherDailyModel weekly;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.background,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.today.address.first,
              style: AppTextStyle.header,
            ),
            Text(
              DatePrettify.dateNow(),
              style: AppTextStyle.body,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: GradientContainer(
          child: Column(
            children: [
              WeatherToday(
                  key: const Key('weathertoday'), weather: widget.today),
              WeatherThisWeek(
                  key: const Key('weatherthisweek'), weather: widget.weekly)
            ],
          ),
        ),
      ),
    );
  }
}
