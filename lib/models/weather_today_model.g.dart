// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_today_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WeatherTodayModel> _$weatherTodayModelSerializer =
    new _$WeatherTodayModelSerializer();

class _$WeatherTodayModelSerializer
    implements StructuredSerializer<WeatherTodayModel> {
  @override
  final Iterable<Type> types = const [WeatherTodayModel, _$WeatherTodayModel];
  @override
  final String wireName = 'WeatherTodayModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeatherTodayModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'time',
      serializers.serialize(object.time,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'temperature_2m',
      serializers.serialize(object.temp,
          specifiedType:
              const FullType(BuiltList, const [const FullType(double)])),
      'weather_code',
      serializers.serialize(object.weatherCode,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
      'address',
      serializers.serialize(object.address,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  WeatherTodayModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WeatherTodayModelBuilder();

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
        case 'temperature_2m':
          result.temp.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object?>);
          break;
        case 'weather_code':
          result.weatherCode.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'address':
          result.address.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherTodayModel extends WeatherTodayModel {
  @override
  final BuiltList<String> time;
  @override
  final BuiltList<double> temp;
  @override
  final BuiltList<int> weatherCode;
  @override
  final BuiltList<String> address;

  factory _$WeatherTodayModel(
          [void Function(WeatherTodayModelBuilder)? updates]) =>
      (new WeatherTodayModelBuilder()..update(updates))._build();

  _$WeatherTodayModel._(
      {required this.time,
      required this.temp,
      required this.weatherCode,
      required this.address})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(time, r'WeatherTodayModel', 'time');
    BuiltValueNullFieldError.checkNotNull(temp, r'WeatherTodayModel', 'temp');
    BuiltValueNullFieldError.checkNotNull(
        weatherCode, r'WeatherTodayModel', 'weatherCode');
    BuiltValueNullFieldError.checkNotNull(
        address, r'WeatherTodayModel', 'address');
  }

  @override
  WeatherTodayModel rebuild(void Function(WeatherTodayModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherTodayModelBuilder toBuilder() =>
      new WeatherTodayModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherTodayModel &&
        time == other.time &&
        temp == other.temp &&
        weatherCode == other.weatherCode &&
        address == other.address;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, time.hashCode);
    _$hash = $jc(_$hash, temp.hashCode);
    _$hash = $jc(_$hash, weatherCode.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WeatherTodayModel')
          ..add('time', time)
          ..add('temp', temp)
          ..add('weatherCode', weatherCode)
          ..add('address', address))
        .toString();
  }
}

class WeatherTodayModelBuilder
    implements Builder<WeatherTodayModel, WeatherTodayModelBuilder> {
  _$WeatherTodayModel? _$v;

  ListBuilder<String>? _time;
  ListBuilder<String> get time => _$this._time ??= new ListBuilder<String>();
  set time(ListBuilder<String>? time) => _$this._time = time;

  ListBuilder<double>? _temp;
  ListBuilder<double> get temp => _$this._temp ??= new ListBuilder<double>();
  set temp(ListBuilder<double>? temp) => _$this._temp = temp;

  ListBuilder<int>? _weatherCode;
  ListBuilder<int> get weatherCode =>
      _$this._weatherCode ??= new ListBuilder<int>();
  set weatherCode(ListBuilder<int>? weatherCode) =>
      _$this._weatherCode = weatherCode;

  ListBuilder<String>? _address;
  ListBuilder<String> get address =>
      _$this._address ??= new ListBuilder<String>();
  set address(ListBuilder<String>? address) => _$this._address = address;

  WeatherTodayModelBuilder();

  WeatherTodayModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _time = $v.time.toBuilder();
      _temp = $v.temp.toBuilder();
      _weatherCode = $v.weatherCode.toBuilder();
      _address = $v.address.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WeatherTodayModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherTodayModel;
  }

  @override
  void update(void Function(WeatherTodayModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherTodayModel build() => _build();

  _$WeatherTodayModel _build() {
    _$WeatherTodayModel _$result;
    try {
      _$result = _$v ??
          new _$WeatherTodayModel._(
              time: time.build(),
              temp: temp.build(),
              weatherCode: weatherCode.build(),
              address: address.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'time';
        time.build();
        _$failedField = 'temp';
        temp.build();
        _$failedField = 'weatherCode';
        weatherCode.build();
        _$failedField = 'address';
        address.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'WeatherTodayModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
