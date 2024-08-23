part of 'weather_bloc.dart';

abstract class WeatherState {}

class InitialWeatherState extends WeatherState {}

class LoadingState extends WeatherState {}

class WeatherDailyLoaded extends WeatherState {
  WeatherDailyLoaded({
    required this.weatherDaily,
  });

  final WeatherDailyModel weatherDaily;

  List<Object> get props => [weatherDaily];
}
