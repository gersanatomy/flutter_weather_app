import 'dart:convert';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app/models/weather_model.dart';
import 'package:flutter_weather_app/models/weather_today_model.dart';
import 'package:flutter_weather_app/services/weather_service.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> with HydratedMixin {
  final WeatherService service;

  WeatherBloc(this.service) : super(InitialWeatherState()) {
    on<GetWeatherDetailsEvent>(
      (event, emit) => _getWeatherDetails(event, emit),
    );
  }

  _getWeatherDetails(
      GetWeatherDetailsEvent event, Emitter<WeatherState> emit) async {
    try {
      emit(LoadingState());
      var weatherToday = await service.getWeatherTodayForecast();
      var weatherWeekly = await service.getWeatherForecast();

      final today = WeatherTodayModel.fromJson(weatherToday['hourly']);
      final weekly = WeatherDailyModel.fromJson(weatherWeekly['daily']);

      HydratedBloc.storage.write('today', today.toJson());
      HydratedBloc.storage.write('weekly', weekly.toJson());

      emit(
        WeatherDataFetched(
          weatherToday: today,
          weatherWeekly: weekly,
        ),
      );
    } catch (e) {
      log(e.toString());
      var localToday = HydratedBloc.storage.read('today');
      var localWeekly = HydratedBloc.storage.read('weekly');

      if (localToday == null || localWeekly == null) {
        emit(WeatherDataEmpty());
        return;
      }

      emit(
        WeatherDataFetched(
          weatherToday: WeatherTodayModel.fromJson(jsonDecode(localToday)),
          weatherWeekly: WeatherDailyModel.fromJson(jsonDecode(localWeekly)),
        ),
      );
    }
  }

  @override
  WeatherState? fromJson(Map<String, dynamic> json) {
    try {
      if (json['today'] != null) {
        return WeatherDataFetched(
          weatherToday: WeatherTodayModel.fromJson(json['today']),
          weatherWeekly: WeatherDailyModel.fromJson(json['weekly']),
        );
      }

      return LoadingState();
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(WeatherState state) {
    if (state is WeatherDataFetched) {
      return {
        'today': state.weatherToday,
        'weekly': state.weatherWeekly,
      };
    }

    return {
      'today': null,
      'weekly': null,
    };
  }
}
