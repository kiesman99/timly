// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'sound_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SoundStateTearOff {
  const _$SoundStateTearOff();

  IDLE idle() {
    return const IDLE();
  }

  Playing playing(int streamId) {
    return Playing(
      streamId,
    );
  }
}

// ignore: unused_element
const $SoundState = _$SoundStateTearOff();

mixin _$SoundState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result idle(),
    @required Result playing(int streamId),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result idle(),
    Result playing(int streamId),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result idle(IDLE value),
    @required Result playing(Playing value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result idle(IDLE value),
    Result playing(Playing value),
    @required Result orElse(),
  });
}

abstract class $SoundStateCopyWith<$Res> {
  factory $SoundStateCopyWith(
          SoundState value, $Res Function(SoundState) then) =
      _$SoundStateCopyWithImpl<$Res>;
}

class _$SoundStateCopyWithImpl<$Res> implements $SoundStateCopyWith<$Res> {
  _$SoundStateCopyWithImpl(this._value, this._then);

  final SoundState _value;
  // ignore: unused_field
  final $Res Function(SoundState) _then;
}

abstract class $IDLECopyWith<$Res> {
  factory $IDLECopyWith(IDLE value, $Res Function(IDLE) then) =
      _$IDLECopyWithImpl<$Res>;
}

class _$IDLECopyWithImpl<$Res> extends _$SoundStateCopyWithImpl<$Res>
    implements $IDLECopyWith<$Res> {
  _$IDLECopyWithImpl(IDLE _value, $Res Function(IDLE) _then)
      : super(_value, (v) => _then(v as IDLE));

  @override
  IDLE get _value => super._value as IDLE;
}

class _$IDLE with DiagnosticableTreeMixin implements IDLE {
  const _$IDLE();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SoundState.idle()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'SoundState.idle'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is IDLE);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result idle(),
    @required Result playing(int streamId),
  }) {
    assert(idle != null);
    assert(playing != null);
    return idle();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result idle(),
    Result playing(int streamId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result idle(IDLE value),
    @required Result playing(Playing value),
  }) {
    assert(idle != null);
    assert(playing != null);
    return idle(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result idle(IDLE value),
    Result playing(Playing value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class IDLE implements SoundState {
  const factory IDLE() = _$IDLE;
}

abstract class $PlayingCopyWith<$Res> {
  factory $PlayingCopyWith(Playing value, $Res Function(Playing) then) =
      _$PlayingCopyWithImpl<$Res>;
  $Res call({int streamId});
}

class _$PlayingCopyWithImpl<$Res> extends _$SoundStateCopyWithImpl<$Res>
    implements $PlayingCopyWith<$Res> {
  _$PlayingCopyWithImpl(Playing _value, $Res Function(Playing) _then)
      : super(_value, (v) => _then(v as Playing));

  @override
  Playing get _value => super._value as Playing;

  @override
  $Res call({
    Object streamId = freezed,
  }) {
    return _then(Playing(
      streamId == freezed ? _value.streamId : streamId as int,
    ));
  }
}

class _$Playing with DiagnosticableTreeMixin implements Playing {
  const _$Playing(this.streamId) : assert(streamId != null);

  @override
  final int streamId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SoundState.playing(streamId: $streamId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SoundState.playing'))
      ..add(DiagnosticsProperty('streamId', streamId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Playing &&
            (identical(other.streamId, streamId) ||
                const DeepCollectionEquality()
                    .equals(other.streamId, streamId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(streamId);

  @override
  $PlayingCopyWith<Playing> get copyWith =>
      _$PlayingCopyWithImpl<Playing>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result idle(),
    @required Result playing(int streamId),
  }) {
    assert(idle != null);
    assert(playing != null);
    return playing(streamId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result idle(),
    Result playing(int streamId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (playing != null) {
      return playing(streamId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result idle(IDLE value),
    @required Result playing(Playing value),
  }) {
    assert(idle != null);
    assert(playing != null);
    return playing(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result idle(IDLE value),
    Result playing(Playing value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (playing != null) {
      return playing(this);
    }
    return orElse();
  }
}

abstract class Playing implements SoundState {
  const factory Playing(int streamId) = _$Playing;

  int get streamId;
  $PlayingCopyWith<Playing> get copyWith;
}
