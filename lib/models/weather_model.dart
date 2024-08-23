class WeatherDailyModel {
  WeatherDailyModel({
    this.time = const <dynamic>[],
    this.tempMin = const <dynamic>[],
    this.tempMax = const <dynamic>[],
    this.sunrise = const <dynamic>[],
    this.sunset = const <dynamic>[],
    this.weatherCode = const <dynamic>[],
    this.precipitationHours = const <dynamic>[],
  });

  late List<dynamic> time;
  late List<dynamic> tempMin;
  late List<dynamic> tempMax;
  late List<dynamic> sunrise;
  late List<dynamic> sunset;
  late List<dynamic> weatherCode;
  late List<dynamic> precipitationHours;

  WeatherDailyModel.fromJson(Map<String, dynamic> json) {
    time = json['time'] ?? [];
    tempMin = json['temperature_2m_min'] ?? <dynamic>[];
    tempMax = json['temperature_2m_max'] ?? <dynamic>[];
    sunrise = json['sunrise'] ?? <dynamic>[];
    sunset = json['sunset'] ?? <dynamic>[];
    weatherCode = json['weather_code'] ?? <dynamic>[];
    precipitationHours = json['precipitation_hours'] ?? <dynamic>[];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['time'] = time;
    data['temperature_2m_min'] = tempMin;
    data['temperature_2m_max'] = tempMax;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['weather_code'] = weatherCode;
    data['precipitation_hours'] = precipitationHours;
    return data;
  }
}
