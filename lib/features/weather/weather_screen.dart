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
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      address = await getCityProvince();
    });
  }

  getCityProvince() async {
    List<String> res = await AppGeoLocator.getCityProvince();
    return res;
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
              if (widget.today.time.isNotEmpty)
                WeatherToday(address: address, weather: widget.today)
              else
                Container(),
              if (widget.weekly.time.isNotEmpty)
                WeatherThisWeek(weather: widget.weekly)
              else
                Container()
            ],
          ),
        ),
      ),
    );
  }
}
