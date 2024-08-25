import 'dart:convert';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app/models/weather_model.dart';
import 'package:flutter_weather_app/models/weather_today_model.dart';
import 'package:flutter_weather_app/services/weather_service.dart';
import 'package:flutter_weather_app/utils/app_geolocator.dart';
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

      final today = await setWeatherToday(weatherToday);
      final weekly = await setWeatherWeekly(weatherWeekly);

      emit(
        WeatherDataFetched(
          weatherToday: today,
          weatherWeekly: weekly,
        ),
      );
    } catch (e) {
      log(e.toString());

      var today = HydratedBloc.storage.read('today');
      var weekly = HydratedBloc.storage.read('weekly');

      if (isStorageEmpty(today, weekly)) {
        emit(WeatherDataEmpty());
        return;
      }

      emit(
        WeatherDataFetched(
          weatherToday: WeatherTodayModel.fromJson(jsonDecode(today)),
          weatherWeekly: WeatherDailyModel.fromJson(jsonDecode(weekly)),
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

  Future<WeatherTodayModel> setWeatherToday(weatherToday) async {
    weatherToday['address'] = await AppGeoLocator.getCityProvince();
    final today = WeatherTodayModel.fromJson(weatherToday['hourly']);
    HydratedBloc.storage.write('today', today.toJson());

    return today;
  }

  Future<WeatherDailyModel> setWeatherWeekly(weatherWeekly) async {
    final weekly = WeatherDailyModel.fromJson(weatherWeekly['daily']);
    HydratedBloc.storage.write('weekly', weekly.toJson());

    return weekly;
  }

  bool isStorageEmpty(localToday, localWeekly) {
    return localToday == null || localWeekly == null;
  }
}
