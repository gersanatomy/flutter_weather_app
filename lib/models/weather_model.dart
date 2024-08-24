import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'serializers.dart';
part 'weather_model.g.dart';

abstract class WeatherDailyModel
    implements Built<WeatherDailyModel, WeatherDailyModelBuilder> {
  BuiltList<String> get time;
  @BuiltValueField(wireName: "temperature_2m_min")
  BuiltList<double> get tempMin;
  @BuiltValueField(wireName: "temperature_2m_max")
  BuiltList<double> get tempMax;
  BuiltList<String> get sunrise;
  BuiltList<String> get sunset;
  @BuiltValueField(wireName: "weather_code")
  BuiltList<int> get weatherCode;
  @BuiltValueField(wireName: "precipitation_hours")
  BuiltList<double> get precipitationHours;

  WeatherDailyModel._();

  factory WeatherDailyModel([Function(WeatherDailyModelBuilder b) updates]) =
      _$WeatherDailyModel;

  String toJson() {
    return json
        .encode(serializers.serializeWith(WeatherDailyModel.serializer, this));
  }

  static WeatherDailyModel fromJson(Map<String, dynamic> data) {
    return serializers.deserializeWith(WeatherDailyModel.serializer, data) ??
        WeatherDailyModel();
  }

  static Serializer<WeatherDailyModel> get serializer =>
      _$weatherDailyModelSerializer;
}
