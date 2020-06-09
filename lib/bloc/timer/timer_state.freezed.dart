// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'timer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$TimerStateTearOff {
  const _$TimerStateTearOff();

  Setup setup(TimlyModel remaining) {
    return Setup(
      remaining,
    );
  }

  Running running(TimlyModel remaining) {
    return Running(
      remaining,
    );
  }

  Paused paused(TimerState lastState) {
    return Paused(
      lastState,
    );
  }

  Recover recover(TimlyModel remaining) {
    return Recover(
      remaining,
    );
  }

  Finished finished() {
    return const Finished();
  }
}

// ignore: unused_element
const $TimerState = _$TimerStateTearOff();

mixin _$TimerState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result setup(TimlyModel remaining),
    @required Result running(TimlyModel remaining),
    @required Result paused(TimerState lastState),
    @required Result recover(TimlyModel remaining),
    @required Result finished(),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result setup(TimlyModel remaining),
    Result running(TimlyModel remaining),
    Result paused(TimerState lastState),
    Result recover(TimlyModel remaining),
    Result finished(),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result setup(Setup value),
    @required Result running(Running value),
    @required Result paused(Paused value),
    @required Result recover(Recover value),
    @required Result finished(Finished value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result setup(Setup value),
    Result running(Running value),
    Result paused(Paused value),
    Result recover(Recover value),
    Result finished(Finished value),
    @required Result orElse(),
  });
}

abstract class $TimerStateCopyWith<$Res> {
  factory $TimerStateCopyWith(
          TimerState value, $Res Function(TimerState) then) =
      _$TimerStateCopyWithImpl<$Res>;
}

class _$TimerStateCopyWithImpl<$Res> implements $TimerStateCopyWith<$Res> {
  _$TimerStateCopyWithImpl(this._value, this._then);

  final TimerState _value;

  // ignore: unused_field
  final $Res Function(TimerState) _then;
}

abstract class $SetupCopyWith<$Res> {
  factory $SetupCopyWith(Setup value, $Res Function(Setup) then) =
      _$SetupCopyWithImpl<$Res>;

  $Res call({TimlyModel remaining});
}

class _$SetupCopyWithImpl<$Res> extends _$TimerStateCopyWithImpl<$Res>
    implements $SetupCopyWith<$Res> {
  _$SetupCopyWithImpl(Setup _value, $Res Function(Setup) _then)
      : super(_value, (v) => _then(v as Setup));

  @override
  Setup get _value => super._value as Setup;

  @override
  $Res call({
    Object remaining = freezed,
  }) {
    return _then(Setup(
      remaining == freezed ? _value.remaining : remaining as TimlyModel,
    ));
  }
}

class _$Setup with DiagnosticableTreeMixin implements Setup {
  const _$Setup(this.remaining) : assert(remaining != null);

  @override
  final TimlyModel remaining;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerState.setup(remaining: $remaining)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimerState.setup'))
      ..add(DiagnosticsProperty('remaining', remaining));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Setup &&
            (identical(other.remaining, remaining) ||
                const DeepCollectionEquality()
                    .equals(other.remaining, remaining)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(remaining);

  @override
  $SetupCopyWith<Setup> get copyWith =>
      _$SetupCopyWithImpl<Setup>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result setup(TimlyModel remaining),
    @required Result running(TimlyModel remaining),
    @required Result paused(TimerState lastState),
    @required Result recover(TimlyModel remaining),
    @required Result finished(),
  }) {
    assert(setup != null);
    assert(running != null);
    assert(paused != null);
    assert(recover != null);
    assert(finished != null);
    return setup(remaining);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result setup(TimlyModel remaining),
    Result running(TimlyModel remaining),
    Result paused(TimerState lastState),
    Result recover(TimlyModel remaining),
    Result finished(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (setup != null) {
      return setup(remaining);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result setup(Setup value),
    @required Result running(Running value),
    @required Result paused(Paused value),
    @required Result recover(Recover value),
    @required Result finished(Finished value),
  }) {
    assert(setup != null);
    assert(running != null);
    assert(paused != null);
    assert(recover != null);
    assert(finished != null);
    return setup(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result setup(Setup value),
    Result running(Running value),
    Result paused(Paused value),
    Result recover(Recover value),
    Result finished(Finished value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (setup != null) {
      return setup(this);
    }
    return orElse();
  }
}

abstract class Setup implements TimerState {
  const factory Setup(TimlyModel remaining) = _$Setup;

  TimlyModel get remaining;

  $SetupCopyWith<Setup> get copyWith;
}

abstract class $RunningCopyWith<$Res> {
  factory $RunningCopyWith(Running value, $Res Function(Running) then) =
      _$RunningCopyWithImpl<$Res>;

  $Res call({TimlyModel remaining});
}

class _$RunningCopyWithImpl<$Res> extends _$TimerStateCopyWithImpl<$Res>
    implements $RunningCopyWith<$Res> {
  _$RunningCopyWithImpl(Running _value, $Res Function(Running) _then)
      : super(_value, (v) => _then(v as Running));

  @override
  Running get _value => super._value as Running;

  @override
  $Res call({
    Object remaining = freezed,
  }) {
    return _then(Running(
      remaining == freezed ? _value.remaining : remaining as TimlyModel,
    ));
  }
}

class _$Running with DiagnosticableTreeMixin implements Running {
  const _$Running(this.remaining) : assert(remaining != null);

  @override
  final TimlyModel remaining;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerState.running(remaining: $remaining)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimerState.running'))
      ..add(DiagnosticsProperty('remaining', remaining));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Running &&
            (identical(other.remaining, remaining) ||
                const DeepCollectionEquality()
                    .equals(other.remaining, remaining)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(remaining);

  @override
  $RunningCopyWith<Running> get copyWith =>
      _$RunningCopyWithImpl<Running>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result setup(TimlyModel remaining),
    @required Result running(TimlyModel remaining),
    @required Result paused(TimerState lastState),
    @required Result recover(TimlyModel remaining),
    @required Result finished(),
  }) {
    assert(setup != null);
    assert(running != null);
    assert(paused != null);
    assert(recover != null);
    assert(finished != null);
    return running(remaining);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result setup(TimlyModel remaining),
    Result running(TimlyModel remaining),
    Result paused(TimerState lastState),
    Result recover(TimlyModel remaining),
    Result finished(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (running != null) {
      return running(remaining);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result setup(Setup value),
    @required Result running(Running value),
    @required Result paused(Paused value),
    @required Result recover(Recover value),
    @required Result finished(Finished value),
  }) {
    assert(setup != null);
    assert(running != null);
    assert(paused != null);
    assert(recover != null);
    assert(finished != null);
    return running(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result setup(Setup value),
    Result running(Running value),
    Result paused(Paused value),
    Result recover(Recover value),
    Result finished(Finished value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (running != null) {
      return running(this);
    }
    return orElse();
  }
}

abstract class Running implements TimerState {
  const factory Running(TimlyModel remaining) = _$Running;

  TimlyModel get remaining;

  $RunningCopyWith<Running> get copyWith;
}

abstract class $PausedCopyWith<$Res> {
  factory $PausedCopyWith(Paused value, $Res Function(Paused) then) =
      _$PausedCopyWithImpl<$Res>;

  $Res call({TimerState lastState});
}

class _$PausedCopyWithImpl<$Res> extends _$TimerStateCopyWithImpl<$Res>
    implements $PausedCopyWith<$Res> {
  _$PausedCopyWithImpl(Paused _value, $Res Function(Paused) _then)
      : super(_value, (v) => _then(v as Paused));

  @override
  Paused get _value => super._value as Paused;

  @override
  $Res call({
    Object lastState = freezed,
  }) {
    return _then(Paused(
      lastState == freezed ? _value.lastState : lastState as TimerState,
    ));
  }
}

class _$Paused with DiagnosticableTreeMixin implements Paused {
  const _$Paused(this.lastState) : assert(lastState != null);

  @override
  final TimerState lastState;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerState.paused(lastState: $lastState)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimerState.paused'))
      ..add(DiagnosticsProperty('lastState', lastState));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Paused &&
            (identical(other.lastState, lastState) ||
                const DeepCollectionEquality()
                    .equals(other.lastState, lastState)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(lastState);

  @override
  $PausedCopyWith<Paused> get copyWith =>
      _$PausedCopyWithImpl<Paused>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result setup(TimlyModel remaining),
    @required Result running(TimlyModel remaining),
    @required Result paused(TimerState lastState),
    @required Result recover(TimlyModel remaining),
    @required Result finished(),
  }) {
    assert(setup != null);
    assert(running != null);
    assert(paused != null);
    assert(recover != null);
    assert(finished != null);
    return paused(lastState);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result setup(TimlyModel remaining),
    Result running(TimlyModel remaining),
    Result paused(TimerState lastState),
    Result recover(TimlyModel remaining),
    Result finished(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (paused != null) {
      return paused(lastState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result setup(Setup value),
    @required Result running(Running value),
    @required Result paused(Paused value),
    @required Result recover(Recover value),
    @required Result finished(Finished value),
  }) {
    assert(setup != null);
    assert(running != null);
    assert(paused != null);
    assert(recover != null);
    assert(finished != null);
    return paused(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result setup(Setup value),
    Result running(Running value),
    Result paused(Paused value),
    Result recover(Recover value),
    Result finished(Finished value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (paused != null) {
      return paused(this);
    }
    return orElse();
  }
}

abstract class Paused implements TimerState {
  const factory Paused(TimerState lastState) = _$Paused;

  TimerState get lastState;

  $PausedCopyWith<Paused> get copyWith;
}

abstract class $RecoverCopyWith<$Res> {
  factory $RecoverCopyWith(Recover value, $Res Function(Recover) then) =
      _$RecoverCopyWithImpl<$Res>;

  $Res call({TimlyModel remaining});
}

class _$RecoverCopyWithImpl<$Res> extends _$TimerStateCopyWithImpl<$Res>
    implements $RecoverCopyWith<$Res> {
  _$RecoverCopyWithImpl(Recover _value, $Res Function(Recover) _then)
      : super(_value, (v) => _then(v as Recover));

  @override
  Recover get _value => super._value as Recover;

  @override
  $Res call({
    Object remaining = freezed,
  }) {
    return _then(Recover(
      remaining == freezed ? _value.remaining : remaining as TimlyModel,
    ));
  }
}

class _$Recover with DiagnosticableTreeMixin implements Recover {
  const _$Recover(this.remaining) : assert(remaining != null);

  @override
  final TimlyModel remaining;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerState.recover(remaining: $remaining)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimerState.recover'))
      ..add(DiagnosticsProperty('remaining', remaining));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Recover &&
            (identical(other.remaining, remaining) ||
                const DeepCollectionEquality()
                    .equals(other.remaining, remaining)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(remaining);

  @override
  $RecoverCopyWith<Recover> get copyWith =>
      _$RecoverCopyWithImpl<Recover>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result setup(TimlyModel remaining),
    @required Result running(TimlyModel remaining),
    @required Result paused(TimerState lastState),
    @required Result recover(TimlyModel remaining),
    @required Result finished(),
  }) {
    assert(setup != null);
    assert(running != null);
    assert(paused != null);
    assert(recover != null);
    assert(finished != null);
    return recover(remaining);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result setup(TimlyModel remaining),
    Result running(TimlyModel remaining),
    Result paused(TimerState lastState),
    Result recover(TimlyModel remaining),
    Result finished(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (recover != null) {
      return recover(remaining);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result setup(Setup value),
    @required Result running(Running value),
    @required Result paused(Paused value),
    @required Result recover(Recover value),
    @required Result finished(Finished value),
  }) {
    assert(setup != null);
    assert(running != null);
    assert(paused != null);
    assert(recover != null);
    assert(finished != null);
    return recover(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result setup(Setup value),
    Result running(Running value),
    Result paused(Paused value),
    Result recover(Recover value),
    Result finished(Finished value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (recover != null) {
      return recover(this);
    }
    return orElse();
  }
}

abstract class Recover implements TimerState {
  const factory Recover(TimlyModel remaining) = _$Recover;

  TimlyModel get remaining;

  $RecoverCopyWith<Recover> get copyWith;
}

abstract class $FinishedCopyWith<$Res> {
  factory $FinishedCopyWith(Finished value, $Res Function(Finished) then) =
      _$FinishedCopyWithImpl<$Res>;
}

class _$FinishedCopyWithImpl<$Res> extends _$TimerStateCopyWithImpl<$Res>
    implements $FinishedCopyWith<$Res> {
  _$FinishedCopyWithImpl(Finished _value, $Res Function(Finished) _then)
      : super(_value, (v) => _then(v as Finished));

  @override
  Finished get _value => super._value as Finished;
}

class _$Finished with DiagnosticableTreeMixin implements Finished {
  const _$Finished();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerState.finished()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'TimerState.finished'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Finished);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result setup(TimlyModel remaining),
    @required Result running(TimlyModel remaining),
    @required Result paused(TimerState lastState),
    @required Result recover(TimlyModel remaining),
    @required Result finished(),
  }) {
    assert(setup != null);
    assert(running != null);
    assert(paused != null);
    assert(recover != null);
    assert(finished != null);
    return finished();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result setup(TimlyModel remaining),
    Result running(TimlyModel remaining),
    Result paused(TimerState lastState),
    Result recover(TimlyModel remaining),
    Result finished(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (finished != null) {
      return finished();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result setup(Setup value),
    @required Result running(Running value),
    @required Result paused(Paused value),
    @required Result recover(Recover value),
    @required Result finished(Finished value),
  }) {
    assert(setup != null);
    assert(running != null);
    assert(paused != null);
    assert(recover != null);
    assert(finished != null);
    return finished(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result setup(Setup value),
    Result running(Running value),
    Result paused(Paused value),
    Result recover(Recover value),
    Result finished(Finished value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (finished != null) {
      return finished(this);
    }
    return orElse();
  }
}

abstract class Finished implements TimerState {
  const factory Finished() = _$Finished;
}
