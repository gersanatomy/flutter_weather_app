part of 'weather_bloc.dart';

abstract class WeatherState {}

class InitialWeatherState extends WeatherState {}

class LoadingState extends WeatherState {}

class WeatherDataFetched extends WeatherState {
  WeatherDataFetched({required this.weatherToday, required this.weatherWeekly});

  final WeatherTodayModel weatherToday;
  final WeatherDailyModel weatherWeekly;

  List<Object> get props => [weatherToday, weatherWeekly];
}
