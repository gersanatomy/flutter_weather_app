import 'package:flutter/material.dart';
import 'package:flutter_weather_app/bloc/weather/weather_bloc.dart';
import 'package:flutter_weather_app/components/gradient_container.dart';
import 'package:flutter_weather_app/constants/colors.dart';
import 'package:flutter_weather_app/constants/textstyles.dart';
import 'package:flutter_weather_app/features/weather/weather_this_week.dart';
import 'package:flutter_weather_app/features/weather/weather_today.dart';
import 'package:flutter_weather_app/models/weather_model.dart';
import 'package:flutter_weather_app/models/weather_today_model.dart';
import 'package:flutter_weather_app/utils/app_date_prettify.dart';
import 'package:flutter_weather_app/utils/app_geolocator.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({
    super.key,
    required this.today,
    required this.weekly,
    required this.bloc,
  });

  final WeatherTodayModel today;
  final WeatherDailyModel weekly;
  final WeatherBloc bloc;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  List<String> address = ['', ''];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async => await _getCityProvince(),
    );
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
              address.first,
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
              WeatherToday(address: address, weather: widget.today),
              WeatherThisWeek(weather: widget.weekly)
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _getCityProvince() async {
    address = await AppGeoLocator.getCityProvince();
    setState(() {});
  }
}
