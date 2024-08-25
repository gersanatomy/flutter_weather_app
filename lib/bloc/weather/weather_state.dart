part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {}

class InitialWeatherState extends WeatherState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoadingState extends WeatherState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class WeatherDataFetched extends WeatherState {
  WeatherDataFetched({required this.weatherToday, required this.weatherWeekly});

  final WeatherTodayModel weatherToday;
  final WeatherDailyModel weatherWeekly;

  @override
  List<Object> get props => [weatherToday, weatherWeekly];
}

class WeatherDataEmpty extends WeatherState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
