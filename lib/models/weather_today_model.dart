class WeatherTodayModel {
  WeatherTodayModel({
    this.time = const <dynamic>[],
    this.temp = const <dynamic>[],
    this.weatherCode = const <dynamic>[],
  });

  late List<dynamic> time;
  late List<dynamic> temp;
  late List<dynamic> weatherCode;

  WeatherTodayModel.fromJson(Map<String, dynamic> json) {
    time = json['time'] ?? [];
    temp = json['temperature_2m'] ?? <dynamic>[];
    weatherCode = json['weather_code'] ?? <dynamic>[];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['time'] = time;
    data['temperature_2m'] = temp;
    data['weather_code'] = weatherCode;
    return data;
  }
}
