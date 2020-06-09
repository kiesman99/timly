// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'sound_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SoundEventTearOff {
  const _$SoundEventTearOff();

  LongBeep shortBeep() {
    return const LongBeep();
  }

  ShortBeep longBeep() {
    return const ShortBeep();
  }
}

// ignore: unused_element
const $SoundEvent = _$SoundEventTearOff();

mixin _$SoundEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result shortBeep(),
    @required Result longBeep(),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result shortBeep(),
    Result longBeep(),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result shortBeep(LongBeep value),
    @required Result longBeep(ShortBeep value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result shortBeep(LongBeep value),
    Result longBeep(ShortBeep value),
    @required Result orElse(),
  });
}

abstract class $SoundEventCopyWith<$Res> {
  factory $SoundEventCopyWith(
          SoundEvent value, $Res Function(SoundEvent) then) =
      _$SoundEventCopyWithImpl<$Res>;
}

class _$SoundEventCopyWithImpl<$Res> implements $SoundEventCopyWith<$Res> {
  _$SoundEventCopyWithImpl(this._value, this._then);

  final SoundEvent _value;

  // ignore: unused_field
  final $Res Function(SoundEvent) _then;
}

abstract class $LongBeepCopyWith<$Res> {
  factory $LongBeepCopyWith(LongBeep value, $Res Function(LongBeep) then) =
      _$LongBeepCopyWithImpl<$Res>;
}

class _$LongBeepCopyWithImpl<$Res> extends _$SoundEventCopyWithImpl<$Res>
    implements $LongBeepCopyWith<$Res> {
  _$LongBeepCopyWithImpl(LongBeep _value, $Res Function(LongBeep) _then)
      : super(_value, (v) => _then(v as LongBeep));

  @override
  LongBeep get _value => super._value as LongBeep;
}

class _$LongBeep with DiagnosticableTreeMixin implements LongBeep {
  const _$LongBeep();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SoundEvent.shortBeep()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'SoundEvent.shortBeep'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LongBeep);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result shortBeep(),
    @required Result longBeep(),
  }) {
    assert(shortBeep != null);
    assert(longBeep != null);
    return shortBeep();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result shortBeep(),
    Result longBeep(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (shortBeep != null) {
      return shortBeep();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result shortBeep(LongBeep value),
    @required Result longBeep(ShortBeep value),
  }) {
    assert(shortBeep != null);
    assert(longBeep != null);
    return shortBeep(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result shortBeep(LongBeep value),
    Result longBeep(ShortBeep value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (shortBeep != null) {
      return shortBeep(this);
    }
    return orElse();
  }
}

abstract class LongBeep implements SoundEvent {
  const factory LongBeep() = _$LongBeep;
}

abstract class $ShortBeepCopyWith<$Res> {
  factory $ShortBeepCopyWith(ShortBeep value, $Res Function(ShortBeep) then) =
      _$ShortBeepCopyWithImpl<$Res>;
}

class _$ShortBeepCopyWithImpl<$Res> extends _$SoundEventCopyWithImpl<$Res>
    implements $ShortBeepCopyWith<$Res> {
  _$ShortBeepCopyWithImpl(ShortBeep _value, $Res Function(ShortBeep) _then)
      : super(_value, (v) => _then(v as ShortBeep));

  @override
  ShortBeep get _value => super._value as ShortBeep;
}

class _$ShortBeep with DiagnosticableTreeMixin implements ShortBeep {
  const _$ShortBeep();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SoundEvent.longBeep()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'SoundEvent.longBeep'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ShortBeep);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result shortBeep(),
    @required Result longBeep(),
  }) {
    assert(shortBeep != null);
    assert(longBeep != null);
    return longBeep();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result shortBeep(),
    Result longBeep(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (longBeep != null) {
      return longBeep();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result shortBeep(LongBeep value),
    @required Result longBeep(ShortBeep value),
  }) {
    assert(shortBeep != null);
    assert(longBeep != null);
    return longBeep(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result shortBeep(LongBeep value),
    Result longBeep(ShortBeep value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (longBeep != null) {
      return longBeep(this);
    }
    return orElse();
  }
}

abstract class ShortBeep implements SoundEvent {
  const factory ShortBeep() = _$ShortBeep;
}
