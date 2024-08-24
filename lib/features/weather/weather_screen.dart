import 'package:flutter/material.dart';
import 'package:flutter_weather_app/bloc/weather/weather_bloc.dart';
import 'package:flutter_weather_app/components/gradient_container.dart';
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
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      address = await getCityProvince();
      setState(() {});
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
          backgroundColor: const Color(0xfff2f8f9),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                address.first,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              Text(
                DatePrettify.weekdayMonthDayToString(DateTime.now()),
                style: TextStyle(fontSize: 14),
              ),
            ],
          )),
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
}
