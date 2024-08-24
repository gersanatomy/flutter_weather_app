import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'serializers.dart';
part 'weather_today_model.g.dart';

abstract class WeatherTodayModel
    implements Built<WeatherTodayModel, WeatherTodayModelBuilder> {
  BuiltList<String> get time;
  @BuiltValueField(wireName: "temperature_2m")
  BuiltList<double> get temp;
  @BuiltValueField(wireName: "weather_code")
  BuiltList<int> get weatherCode;

  WeatherTodayModel._();

  factory WeatherTodayModel([Function(WeatherTodayModelBuilder b) updates]) =
      _$WeatherTodayModel;

  String toJson() {
    return json
        .encode(serializers.serializeWith(WeatherTodayModel.serializer, this));
  }

  static WeatherTodayModel fromJson(Map<String, dynamic> data) {
    return serializers.deserializeWith(WeatherTodayModel.serializer, data) ??
        WeatherTodayModel();
  }

  static Serializer<WeatherTodayModel> get serializer =>
      _$weatherTodayModelSerializer;
}
