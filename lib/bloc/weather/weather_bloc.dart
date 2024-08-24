import 'dart:convert';
import 'dart:developer';

import 'package:flutter_weather_app/models/weather_model.dart';
import 'package:flutter_weather_app/models/weather_today_model.dart';
import 'package:flutter_weather_app/services/weather_service.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../utils/app_shared_pref.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends HydratedBloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(InitialWeatherState()) {
    on<GetWeatherDetailsEvent>(
      (event, emit) => _getWeatherDetails(event, emit),
    );
  }

  _getWeatherDetails(
      GetWeatherDetailsEvent event, Emitter<WeatherState> emit) async {
    try {
      emit(LoadingState());
      var weatherToday = await WeatherService().getWeatherTodayForecast();
      var weatherWeekly = await WeatherService().getWeatherForecast();

      final today = WeatherTodayModel.fromJson(weatherToday['hourly']);
      final weekly = WeatherDailyModel.fromJson(weatherWeekly['daily']);

      log('here: today $today');

      SharedPref().setWeatherToday(today);
      SharedPref().setWeatherWeekly(weekly);

      emit(
        WeatherDataFetched(
          weatherToday: today,
          weatherWeekly: weekly,
        ),
      );
    } catch (e) {
      log(e.toString());
      var localDataDaily = await SharedPref().getWeatherToday();
      var localDataWeekly = await SharedPref().getWeatherWeekly();

      emit(
        WeatherDataFetched(
          weatherToday: WeatherTodayModel.fromJson(
              localDataDaily != null ? jsonDecode(localDataDaily) : {}),
          weatherWeekly: WeatherDailyModel.fromJson(
              localDataWeekly != null ? jsonDecode(localDataWeekly) : {}),
        ),
      );
    }
  }

  @override
  WeatherState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(WeatherState state) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
