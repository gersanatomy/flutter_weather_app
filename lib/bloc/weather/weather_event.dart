part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {}

class GetWeatherDetailsEvent extends WeatherEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class WeatherDetailsEmpty extends WeatherEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
