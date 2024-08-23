import 'package:flutter/material.dart';

class WeatherAppRoute extends StatefulWidget {
  const WeatherAppRoute({super.key});

  @override
  State<WeatherAppRoute> createState() => _WeatherAppRouteState();
}

class _WeatherAppRouteState extends State<WeatherAppRoute> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
          // child: ,
          ),
    );
  }
}
