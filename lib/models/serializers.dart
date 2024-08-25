import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutter_weather_app/models/weather_model.dart';
import 'package:flutter_weather_app/models/weather_today_model.dart';

part 'serializers.g.dart';

@SerializersFor([WeatherTodayModel, WeatherDailyModel])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
