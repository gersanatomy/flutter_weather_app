import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/models/weather_model.dart';
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
      var response = await WeatherService().getWeatherForecast();

      SharedPref()
          .setWeatherDaily(WeatherDailyModel.fromJson(response['daily']));

      emit(
        WeatherDailyLoaded(
          weatherDaily: WeatherDailyModel.fromJson(response['daily']),
        ),
      );
    } catch (e) {
      log(e.toString());
      var sharedPref = await SharedPref().getWeatherDaily();
      emit(
        WeatherDailyLoaded(
          weatherDaily: WeatherDailyModel.fromJson(
              sharedPref != null ? jsonDecode(sharedPref) : {}),
        ),
      );
    }
  }
}
