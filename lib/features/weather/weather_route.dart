import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/bloc/weather/weather_bloc.dart';
import 'package:flutter_weather_app/features/splash/splash_screen.dart';
import 'package:flutter_weather_app/features/weather/weather_screen.dart';

class WeatherAppRoute extends StatefulWidget {
  const WeatherAppRoute({super.key});

  @override
  State<WeatherAppRoute> createState() => _WeatherAppRouteState();
}

class _WeatherAppRouteState extends State<WeatherAppRoute> {
  final WeatherBloc _bloc = WeatherBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(GetWeatherDetailsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state is WeatherDataFetched) {
          return WeatherScreen(
            today: state.weatherToday,
            weekly: state.weatherWeekly,
            bloc: _bloc,
          );
        }

        return const SplashScreen();
      },
    );
  }
}
