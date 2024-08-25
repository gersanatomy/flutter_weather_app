import 'package:flutter_weather_app/models/weather_model.dart';
import 'package:flutter_weather_app/models/weather_today_model.dart';

class MockWeatherModels {
  static getToday() {
    return {
      "latitude": 14.125,
      "longitude": 121.125,
      "generationtime_ms": 0.025987625122070312,
      "utc_offset_seconds": 0,
      "timezone": "GMT",
      "timezone_abbreviation": "GMT",
      "elevation": 144.0,
      "hourly_units": {
        "time": "iso8601",
        "temperature_2m": "°C",
        "weather_code": "wmo code"
      },
      "hourly": {
        "time": [
          "2024-08-23T00:00",
          "2024-08-23T01:00",
          "2024-08-23T02:00",
          "2024-08-23T03:00",
          "2024-08-23T04:00",
          "2024-08-23T05:00",
          "2024-08-23T06:00",
          "2024-08-23T07:00",
          "2024-08-23T08:00",
          "2024-08-23T09:00",
          "2024-08-23T10:00",
          "2024-08-23T11:00",
          "2024-08-23T12:00",
          "2024-08-23T13:00",
          "2024-08-23T14:00",
          "2024-08-23T15:00",
          "2024-08-23T16:00",
          "2024-08-23T17:00",
          "2024-08-23T18:00",
          "2024-08-23T19:00",
          "2024-08-23T20:00",
          "2024-08-23T21:00",
          "2024-08-23T22:00",
          "2024-08-23T23:00"
        ],
        "temperature_2m": [
          27.8,
          29.2,
          30.1,
          30.9,
          31.7,
          31.9,
          32.2,
          31.5,
          30.8,
          29.5,
          28.4,
          27.5,
          27.2,
          26.8,
          26.4,
          26.1,
          26.0,
          25.8,
          25.0,
          24.9,
          24.9,
          24.9,
          24.9,
          25.5
        ],
        "weather_code": [
          3,
          2,
          3,
          3,
          3,
          3,
          95,
          80,
          80,
          95,
          95,
          95,
          95,
          95,
          80,
          3,
          3,
          3,
          3,
          45,
          45,
          45,
          45,
          45
        ]
      }
    };
  }

  static getWeekly() {
    return {
      "latitude": 14.125,
      "longitude": 121.125,
      "generationtime_ms": 0.06401538848876953,
      "utc_offset_seconds": 0,
      "timezone": "GMT",
      "timezone_abbreviation": "GMT",
      "elevation": 144.0,
      "daily_units": {
        "time": "iso8601",
        "temperature_2m_max": "°C",
        "temperature_2m_min": "°C",
        "sunrise": "iso8601",
        "sunset": "iso8601",
        "weather_code": "wmo code",
        "precipitation_hours": "h"
      },
      "daily": {
        "time": [
          "2024-08-24",
          "2024-08-25",
          "2024-08-26",
          "2024-08-27",
          "2024-08-28",
          "2024-08-29",
          "2024-08-30"
        ],
        "temperature_2m_max": [29.6, 31.1, 30.7, 29.9, 30.5, 29.7, 32.1],
        "temperature_2m_min": [24.1, 24.1, 24.7, 24.8, 24.5, 24.1, 24.1],
        "sunrise": [
          "2024-08-23T21:43",
          "2024-08-24T21:43",
          "2024-08-25T21:43",
          "2024-08-26T21:43",
          "2024-08-27T21:43",
          "2024-08-28T21:43",
          "2024-08-29T21:43"
        ],
        "sunset": [
          "2024-08-24T10:12",
          "2024-08-25T10:11",
          "2024-08-26T10:11",
          "2024-08-27T10:10",
          "2024-08-28T10:09",
          "2024-08-29T10:09",
          "2024-08-30T10:08"
        ],
        "weather_code": [95, 95, 95, 95, 80, 80, 95],
        "precipitation_hours": [5.0, 10.0, 8.0, 8.0, 10.0, 12.0, 12.0]
      }
    };
  }

  static WeatherTodayModel setToday() {
    var data = getToday();
    return WeatherTodayModel.fromJson(data['hourly']);
  }

  static WeatherDailyModel setWeekly() {
    var data = getWeekly();
    return WeatherDailyModel.fromJson(data['daily']);
  }
}
