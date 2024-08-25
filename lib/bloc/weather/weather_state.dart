part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {}

class InitialWeatherState extends WeatherState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoadingState extends WeatherState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class WeatherDataFetched extends WeatherState {
  WeatherDataFetched({required this.weatherToday, required this.weatherWeekly});

  final WeatherTodayModel weatherToday;
  final WeatherDailyModel weatherWeekly;

  List<Object> get props => [weatherToday, weatherWeekly];
}
