class WeatherDailyModel {
  WeatherDailyModel({
    this.time = const <String>[],
    this.tempMin = const <num>[],
    this.tempMax = const <num>[],
    this.sunrise = const <String>[],
    this.sunset = const <String>[],
    this.weatherCode = const <num>[],
    this.precipitationHours = const <num>[],
  });

  late List<String> time;
  late List<num> tempMin;
  late List<num> tempMax;
  late List<String> sunrise;
  late List<String> sunset;
  late List<num> weatherCode;
  late List<num> precipitationHours;

  WeatherDailyModel.fromJson(Map<String, dynamic> json) {
    time = json['time'] ?? [];
    tempMin = json['temperature_2m_min'] ?? [];
    tempMax = json['temperature_2m_max'] ?? [];
    sunrise = json['sunrise'] ?? [];
    sunset = json['sunset'] ?? [];
    weatherCode = json['weather_code'] ?? [];
    precipitationHours = json['precipitation_hours'] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

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
