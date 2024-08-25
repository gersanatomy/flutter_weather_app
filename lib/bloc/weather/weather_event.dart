part of 'weather_bloc.dart';

abstract class WeatherEvent {}

class GetWeatherDetailsEvent extends WeatherEvent {}

class WeatherDetailsEmpty extends WeatherEvent {}
