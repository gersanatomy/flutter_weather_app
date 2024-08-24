// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WeatherDailyModel> _$weatherDailyModelSerializer =
    new _$WeatherDailyModelSerializer();

class _$WeatherDailyModelSerializer
    implements StructuredSerializer<WeatherDailyModel> {
  @override
  final Iterable<Type> types = const [WeatherDailyModel, _$WeatherDailyModel];
  @override
  final String wireName = 'WeatherDailyModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeatherDailyModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'time',
      serializers.serialize(object.time,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'temperature_2m_min',
      serializers.serialize(object.tempMin,
          specifiedType:
              const FullType(BuiltList, const [const FullType(double)])),
      'temperature_2m_max',
      serializers.serialize(object.tempMax,
          specifiedType:
              const FullType(BuiltList, const [const FullType(double)])),
      'sunrise',
      serializers.serialize(object.sunrise,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'sunset',
      serializers.serialize(object.sunset,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'weather_code',
      serializers.serialize(object.weatherCode,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
      'precipitation_hours',
      serializers.serialize(object.precipitationHours,
          specifiedType:
              const FullType(BuiltList, const [const FullType(double)])),
    ];

    return result;
  }

  @override
  WeatherDailyModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WeatherDailyModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'time':
          result.time.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'temperature_2m_min':
          result.tempMin.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object?>);
          break;
        case 'temperature_2m_max':
          result.tempMax.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object?>);
          break;
        case 'sunrise':
          result.sunrise.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'sunset':
          result.sunset.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'weather_code':
          result.weatherCode.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'precipitation_hours':
          result.precipitationHours.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherDailyModel extends WeatherDailyModel {
  @override
  final BuiltList<String> time;
  @override
  final BuiltList<double> tempMin;
  @override
  final BuiltList<double> tempMax;
  @override
  final BuiltList<String> sunrise;
  @override
  final BuiltList<String> sunset;
  @override
  final BuiltList<int> weatherCode;
  @override
  final BuiltList<double> precipitationHours;

  factory _$WeatherDailyModel(
          [void Function(WeatherDailyModelBuilder)? updates]) =>
      (new WeatherDailyModelBuilder()..update(updates))._build();

  _$WeatherDailyModel._(
      {required this.time,
      required this.tempMin,
      required this.tempMax,
      required this.sunrise,
      required this.sunset,
      required this.weatherCode,
      required this.precipitationHours})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(time, r'WeatherDailyModel', 'time');
    BuiltValueNullFieldError.checkNotNull(
        tempMin, r'WeatherDailyModel', 'tempMin');
    BuiltValueNullFieldError.checkNotNull(
        tempMax, r'WeatherDailyModel', 'tempMax');
    BuiltValueNullFieldError.checkNotNull(
        sunrise, r'WeatherDailyModel', 'sunrise');
    BuiltValueNullFieldError.checkNotNull(
        sunset, r'WeatherDailyModel', 'sunset');
    BuiltValueNullFieldError.checkNotNull(
        weatherCode, r'WeatherDailyModel', 'weatherCode');
    BuiltValueNullFieldError.checkNotNull(
        precipitationHours, r'WeatherDailyModel', 'precipitationHours');
  }

  @override
  WeatherDailyModel rebuild(void Function(WeatherDailyModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherDailyModelBuilder toBuilder() =>
      new WeatherDailyModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherDailyModel &&
        time == other.time &&
        tempMin == other.tempMin &&
        tempMax == other.tempMax &&
        sunrise == other.sunrise &&
        sunset == other.sunset &&
        weatherCode == other.weatherCode &&
        precipitationHours == other.precipitationHours;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, time.hashCode);
    _$hash = $jc(_$hash, tempMin.hashCode);
    _$hash = $jc(_$hash, tempMax.hashCode);
    _$hash = $jc(_$hash, sunrise.hashCode);
    _$hash = $jc(_$hash, sunset.hashCode);
    _$hash = $jc(_$hash, weatherCode.hashCode);
    _$hash = $jc(_$hash, precipitationHours.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WeatherDailyModel')
          ..add('time', time)
          ..add('tempMin', tempMin)
          ..add('tempMax', tempMax)
          ..add('sunrise', sunrise)
          ..add('sunset', sunset)
          ..add('weatherCode', weatherCode)
          ..add('precipitationHours', precipitationHours))
        .toString();
  }
}

class WeatherDailyModelBuilder
    implements Builder<WeatherDailyModel, WeatherDailyModelBuilder> {
  _$WeatherDailyModel? _$v;

  ListBuilder<String>? _time;
  ListBuilder<String> get time => _$this._time ??= new ListBuilder<String>();
  set time(ListBuilder<String>? time) => _$this._time = time;

  ListBuilder<double>? _tempMin;
  ListBuilder<double> get tempMin =>
      _$this._tempMin ??= new ListBuilder<double>();
  set tempMin(ListBuilder<double>? tempMin) => _$this._tempMin = tempMin;

  ListBuilder<double>? _tempMax;
  ListBuilder<double> get tempMax =>
      _$this._tempMax ??= new ListBuilder<double>();
  set tempMax(ListBuilder<double>? tempMax) => _$this._tempMax = tempMax;

  ListBuilder<String>? _sunrise;
  ListBuilder<String> get sunrise =>
      _$this._sunrise ??= new ListBuilder<String>();
  set sunrise(ListBuilder<String>? sunrise) => _$this._sunrise = sunrise;

  ListBuilder<String>? _sunset;
  ListBuilder<String> get sunset =>
      _$this._sunset ??= new ListBuilder<String>();
  set sunset(ListBuilder<String>? sunset) => _$this._sunset = sunset;

  ListBuilder<int>? _weatherCode;
  ListBuilder<int> get weatherCode =>
      _$this._weatherCode ??= new ListBuilder<int>();
  set weatherCode(ListBuilder<int>? weatherCode) =>
      _$this._weatherCode = weatherCode;

  ListBuilder<double>? _precipitationHours;
  ListBuilder<double> get precipitationHours =>
      _$this._precipitationHours ??= new ListBuilder<double>();
  set precipitationHours(ListBuilder<double>? precipitationHours) =>
      _$this._precipitationHours = precipitationHours;

  WeatherDailyModelBuilder();

  WeatherDailyModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _time = $v.time.toBuilder();
      _tempMin = $v.tempMin.toBuilder();
      _tempMax = $v.tempMax.toBuilder();
      _sunrise = $v.sunrise.toBuilder();
      _sunset = $v.sunset.toBuilder();
      _weatherCode = $v.weatherCode.toBuilder();
      _precipitationHours = $v.precipitationHours.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WeatherDailyModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherDailyModel;
  }

  @override
  void update(void Function(WeatherDailyModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherDailyModel build() => _build();

  _$WeatherDailyModel _build() {
    _$WeatherDailyModel _$result;
    try {
      _$result = _$v ??
          new _$WeatherDailyModel._(
              time: time.build(),
              tempMin: tempMin.build(),
              tempMax: tempMax.build(),
              sunrise: sunrise.build(),
              sunset: sunset.build(),
              weatherCode: weatherCode.build(),
              precipitationHours: precipitationHours.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'time';
        time.build();
        _$failedField = 'tempMin';
        tempMin.build();
        _$failedField = 'tempMax';
        tempMax.build();
        _$failedField = 'sunrise';
        sunrise.build();
        _$failedField = 'sunset';
        sunset.build();
        _$failedField = 'weatherCode';
        weatherCode.build();
        _$failedField = 'precipitationHours';
        precipitationHours.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'WeatherDailyModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
