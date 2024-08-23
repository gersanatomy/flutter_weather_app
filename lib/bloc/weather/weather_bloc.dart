import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/models/weather_model.dart';
import 'package:flutter_weather_app/models/weather_today_model.dart';
import 'package:flutter_weather_app/services/weather_service.dart';

import '../../utils/app_shared_pref.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
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
}
