// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'timly_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$TimlyModelTearOff {
  const _$TimlyModelTearOff();

  _TimlyModel call(
      {@required Duration intervalDuration,
      @required Duration recoverDuration,
      @required Duration setupDuration,
      @required int laps}) {
    return _TimlyModel(
      intervalDuration: intervalDuration,
      recoverDuration: recoverDuration,
      setupDuration: setupDuration,
      laps: laps,
    );
  }
}

// ignore: unused_element
const $TimlyModel = _$TimlyModelTearOff();

mixin _$TimlyModel {
  Duration get intervalDuration;

  Duration get recoverDuration;

  Duration get setupDuration;

  int get laps;

  $TimlyModelCopyWith<TimlyModel> get copyWith;
}

abstract class $TimlyModelCopyWith<$Res> {
  factory $TimlyModelCopyWith(
          TimlyModel value, $Res Function(TimlyModel) then) =
      _$TimlyModelCopyWithImpl<$Res>;

  $Res call(
      {Duration intervalDuration,
      Duration recoverDuration,
      Duration setupDuration,
      int laps});
}

class _$TimlyModelCopyWithImpl<$Res> implements $TimlyModelCopyWith<$Res> {
  _$TimlyModelCopyWithImpl(this._value, this._then);

  final TimlyModel _value;

  // ignore: unused_field
  final $Res Function(TimlyModel) _then;

  @override
  $Res call({
    Object intervalDuration = freezed,
    Object recoverDuration = freezed,
    Object setupDuration = freezed,
    Object laps = freezed,
  }) {
    return _then(_value.copyWith(
      intervalDuration: intervalDuration == freezed
          ? _value.intervalDuration
          : intervalDuration as Duration,
      recoverDuration: recoverDuration == freezed
          ? _value.recoverDuration
          : recoverDuration as Duration,
      setupDuration: setupDuration == freezed
          ? _value.setupDuration
          : setupDuration as Duration,
      laps: laps == freezed ? _value.laps : laps as int,
    ));
  }
}

abstract class _$TimlyModelCopyWith<$Res> implements $TimlyModelCopyWith<$Res> {
  factory _$TimlyModelCopyWith(
          _TimlyModel value, $Res Function(_TimlyModel) then) =
      __$TimlyModelCopyWithImpl<$Res>;

  @override
  $Res call(
      {Duration intervalDuration,
      Duration recoverDuration,
      Duration setupDuration,
      int laps});
}

class __$TimlyModelCopyWithImpl<$Res> extends _$TimlyModelCopyWithImpl<$Res>
    implements _$TimlyModelCopyWith<$Res> {
  __$TimlyModelCopyWithImpl(
      _TimlyModel _value, $Res Function(_TimlyModel) _then)
      : super(_value, (v) => _then(v as _TimlyModel));

  @override
  _TimlyModel get _value => super._value as _TimlyModel;

  @override
  $Res call({
    Object intervalDuration = freezed,
    Object recoverDuration = freezed,
    Object setupDuration = freezed,
    Object laps = freezed,
  }) {
    return _then(_TimlyModel(
      intervalDuration: intervalDuration == freezed
          ? _value.intervalDuration
          : intervalDuration as Duration,
      recoverDuration: recoverDuration == freezed
          ? _value.recoverDuration
          : recoverDuration as Duration,
      setupDuration: setupDuration == freezed
          ? _value.setupDuration
          : setupDuration as Duration,
      laps: laps == freezed ? _value.laps : laps as int,
    ));
  }
}

class _$_TimlyModel with DiagnosticableTreeMixin implements _TimlyModel {
  const _$_TimlyModel(
      {@required this.intervalDuration,
      @required this.recoverDuration,
      @required this.setupDuration,
      @required this.laps})
      : assert(intervalDuration != null),
        assert(recoverDuration != null),
        assert(setupDuration != null),
        assert(laps != null);

  @override
  final Duration intervalDuration;
  @override
  final Duration recoverDuration;
  @override
  final Duration setupDuration;
  @override
  final int laps;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimlyModel(intervalDuration: $intervalDuration, recoverDuration: $recoverDuration, setupDuration: $setupDuration, laps: $laps)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimlyModel'))
      ..add(DiagnosticsProperty('intervalDuration', intervalDuration))
      ..add(DiagnosticsProperty('recoverDuration', recoverDuration))
      ..add(DiagnosticsProperty('setupDuration', setupDuration))
      ..add(DiagnosticsProperty('laps', laps));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TimlyModel &&
            (identical(other.intervalDuration, intervalDuration) ||
                const DeepCollectionEquality()
                    .equals(other.intervalDuration, intervalDuration)) &&
            (identical(other.recoverDuration, recoverDuration) ||
                const DeepCollectionEquality()
                    .equals(other.recoverDuration, recoverDuration)) &&
            (identical(other.setupDuration, setupDuration) ||
                const DeepCollectionEquality()
                    .equals(other.setupDuration, setupDuration)) &&
            (identical(other.laps, laps) ||
                const DeepCollectionEquality().equals(other.laps, laps)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(intervalDuration) ^
      const DeepCollectionEquality().hash(recoverDuration) ^
      const DeepCollectionEquality().hash(setupDuration) ^
      const DeepCollectionEquality().hash(laps);

  @override
  _$TimlyModelCopyWith<_TimlyModel> get copyWith =>
      __$TimlyModelCopyWithImpl<_TimlyModel>(this, _$identity);
}

abstract class _TimlyModel implements TimlyModel {
  const factory _TimlyModel(
      {@required Duration intervalDuration,
      @required Duration recoverDuration,
      @required Duration setupDuration,
      @required int laps}) = _$_TimlyModel;

  @override
  Duration get intervalDuration;

  @override
  Duration get recoverDuration;

  @override
  Duration get setupDuration;

  @override
  int get laps;

  @override
  _$TimlyModelCopyWith<_TimlyModel> get copyWith;
}
