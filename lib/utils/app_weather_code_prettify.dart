import 'package:flutter_weather_app/utils/app_date_prettify.dart';

class WeatherCodePrettify {
  static getDescription(int value) {
    switch (value) {
      case 0:
        return 'Clear sky';
      case 1 || 2 || 3:
        return 'Mainly clear, partly cloudy, and overcast';
      case 45 || 48:
        return 'Fog and depositing rime fog';
      case 51 || 53 || 55:
        return 'Drizzle:\n Light, moderate, and dense intensity';
      case 56 || 57:
        return 'Freezing Drizzle:\n Light and dense intensity';
      case 61 || 63 || 65:
        return 'Rain:\n Slight, moderate and heavy intensity';
      case 66 || 67:
        return 'Freezing Rain:\n Light and heavy intensity';
      case 71 || 73 || 75:
        return 'Snow fall:\n Slight, moderate, and heavy intensity';
      case 77:
        return 'Snow grains';
      case 80 || 81 || 82:
        return 'Rain showers:\nSlight, moderate, and violent';
      case 85 || 86:
        return 'Snow showers slight and heavy';
      case 95:
        return 'Thunderstorm:\nSlight or moderate';
      case 96 || 99:
        return 'Thunderstorm with slight and heavy hail';
      default:
        return '';
    }
  }

  static getImageAsset(int value, String time) {
    bool isDayTime = DatePrettify.isDayTime(value: time);

    switch (value) {
      case 0:
        return isDayTime ? 'assets/day.png' : 'assets/night.png';
      case 1 || 2 || 3:
        return isDayTime ? 'assets/cloudy_1.png' : 'assets/cloudy_2.png';
      case 45 || 48 || 51 || 53 || 55 || 56 || 57:
        return isDayTime ? 'assets/fog_1.png' : 'assets/fog_2.png';
      case 61 || 63 || 65 || 66 || 67:
        return isDayTime ? 'assets/rain_1.png' : 'assets/rain_2.png';
      case 71 || 73 || 75 || 77 || 80 || 81 || 82 || 85 || 86:
        return isDayTime ? 'assets/snow_1.png' : 'assets/snow_2.png';
      case 95 || 96 || 99:
        return isDayTime ? 'assets/storm_1.png' : 'assets/storm_2.png';
      default:
        return 'assets/weather.png';
    }
  }
}
