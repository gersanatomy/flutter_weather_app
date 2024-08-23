import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/weather_today_model.dart';
import 'package:flutter_weather_app/utils/app_date_prettify.dart';
import 'package:flutter_weather_app/utils/app_weather_code_prettify.dart';

class WeatherToday extends StatefulWidget {
  const WeatherToday({super.key, required this.weather, required this.address});

  final WeatherTodayModel weather;
  final List<String> address;

  @override
  State<WeatherToday> createState() => _WeatherTodayState();
}

class _WeatherTodayState extends State<WeatherToday> {
  bool showPerHour = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: showPerHour ? 320 : 170,
      color: const Color(0xfff2f8f9),
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
                      widget.weather.weatherCode.first, false),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${widget.weather.temp.first}°',
                    style: const TextStyle(fontSize: 40),
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
          Visibility(
            visible: showPerHour,
            child: Container(
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
                    color: showPerHour
                        ? Colors.grey[400]
                        : const Color(0xff7f94b7),
                    fontWeight: FontWeight.w600),
              ),
            )),
          )
        ],
      ),
    );
  }
}

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
                  weather.weatherCode[index], false),
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
