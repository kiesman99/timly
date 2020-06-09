// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'timer_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$TimerEventTearOff {
  const _$TimerEventTearOff();

  SetupTick setupTick() {
    return const SetupTick();
  }

  RunningTick runningTick() {
    return const RunningTick();
  }

  RecoverTick recoverTick() {
    return const RecoverTick();
  }

  Pause pause() {
    return const Pause();
  }

  Resume resume() {
    return const Resume();
  }

  Replay replay() {
    return const Replay();
  }
}

// ignore: unused_element
const $TimerEvent = _$TimerEventTearOff();

mixin _$TimerEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result setupTick(),
    @required Result runningTick(),
    @required Result recoverTick(),
    @required Result pause(),
    @required Result resume(),
    @required Result replay(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result setupTick(),
    Result runningTick(),
    Result recoverTick(),
    Result pause(),
    Result resume(),
    Result replay(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result setupTick(SetupTick value),
    @required Result runningTick(RunningTick value),
    @required Result recoverTick(RecoverTick value),
    @required Result pause(Pause value),
    @required Result resume(Resume value),
    @required Result replay(Replay value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result setupTick(SetupTick value),
    Result runningTick(RunningTick value),
    Result recoverTick(RecoverTick value),
    Result pause(Pause value),
    Result resume(Resume value),
    Result replay(Replay value),
    @required Result orElse(),
  });
}

abstract class $TimerEventCopyWith<$Res> {
  factory $TimerEventCopyWith(
          TimerEvent value, $Res Function(TimerEvent) then) =
      _$TimerEventCopyWithImpl<$Res>;
}

class _$TimerEventCopyWithImpl<$Res> implements $TimerEventCopyWith<$Res> {
  _$TimerEventCopyWithImpl(this._value, this._then);

  final TimerEvent _value;
  // ignore: unused_field
  final $Res Function(TimerEvent) _then;
}

abstract class $SetupTickCopyWith<$Res> {
  factory $SetupTickCopyWith(SetupTick value, $Res Function(SetupTick) then) =
      _$SetupTickCopyWithImpl<$Res>;
}

class _$SetupTickCopyWithImpl<$Res> extends _$TimerEventCopyWithImpl<$Res>
    implements $SetupTickCopyWith<$Res> {
  _$SetupTickCopyWithImpl(SetupTick _value, $Res Function(SetupTick) _then)
      : super(_value, (v) => _then(v as SetupTick));

  @override
  SetupTick get _value => super._value as SetupTick;
}

class _$SetupTick with DiagnosticableTreeMixin implements SetupTick {
  const _$SetupTick();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerEvent.setupTick()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'TimerEvent.setupTick'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SetupTick);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result setupTick(),
    @required Result runningTick(),
    @required Result recoverTick(),
    @required Result pause(),
    @required Result resume(),
    @required Result replay(),
  }) {
    assert(setupTick != null);
    assert(runningTick != null);
    assert(recoverTick != null);
    assert(pause != null);
    assert(resume != null);
    assert(replay != null);
    return setupTick();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result setupTick(),
    Result runningTick(),
    Result recoverTick(),
    Result pause(),
    Result resume(),
    Result replay(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (setupTick != null) {
      return setupTick();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result setupTick(SetupTick value),
    @required Result runningTick(RunningTick value),
    @required Result recoverTick(RecoverTick value),
    @required Result pause(Pause value),
    @required Result resume(Resume value),
    @required Result replay(Replay value),
  }) {
    assert(setupTick != null);
    assert(runningTick != null);
    assert(recoverTick != null);
    assert(pause != null);
    assert(resume != null);
    assert(replay != null);
    return setupTick(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result setupTick(SetupTick value),
    Result runningTick(RunningTick value),
    Result recoverTick(RecoverTick value),
    Result pause(Pause value),
    Result resume(Resume value),
    Result replay(Replay value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (setupTick != null) {
      return setupTick(this);
    }
    return orElse();
  }
}

abstract class SetupTick implements TimerEvent {
  const factory SetupTick() = _$SetupTick;
}

abstract class $RunningTickCopyWith<$Res> {
  factory $RunningTickCopyWith(
          RunningTick value, $Res Function(RunningTick) then) =
      _$RunningTickCopyWithImpl<$Res>;
}

class _$RunningTickCopyWithImpl<$Res> extends _$TimerEventCopyWithImpl<$Res>
    implements $RunningTickCopyWith<$Res> {
  _$RunningTickCopyWithImpl(
      RunningTick _value, $Res Function(RunningTick) _then)
      : super(_value, (v) => _then(v as RunningTick));

  @override
  RunningTick get _value => super._value as RunningTick;
}

class _$RunningTick with DiagnosticableTreeMixin implements RunningTick {
  const _$RunningTick();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerEvent.runningTick()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'TimerEvent.runningTick'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RunningTick);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result setupTick(),
    @required Result runningTick(),
    @required Result recoverTick(),
    @required Result pause(),
    @required Result resume(),
    @required Result replay(),
  }) {
    assert(setupTick != null);
    assert(runningTick != null);
    assert(recoverTick != null);
    assert(pause != null);
    assert(resume != null);
    assert(replay != null);
    return runningTick();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result setupTick(),
    Result runningTick(),
    Result recoverTick(),
    Result pause(),
    Result resume(),
    Result replay(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (runningTick != null) {
      return runningTick();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result setupTick(SetupTick value),
    @required Result runningTick(RunningTick value),
    @required Result recoverTick(RecoverTick value),
    @required Result pause(Pause value),
    @required Result resume(Resume value),
    @required Result replay(Replay value),
  }) {
    assert(setupTick != null);
    assert(runningTick != null);
    assert(recoverTick != null);
    assert(pause != null);
    assert(resume != null);
    assert(replay != null);
    return runningTick(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result setupTick(SetupTick value),
    Result runningTick(RunningTick value),
    Result recoverTick(RecoverTick value),
    Result pause(Pause value),
    Result resume(Resume value),
    Result replay(Replay value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (runningTick != null) {
      return runningTick(this);
    }
    return orElse();
  }
}

abstract class RunningTick implements TimerEvent {
  const factory RunningTick() = _$RunningTick;
}

abstract class $RecoverTickCopyWith<$Res> {
  factory $RecoverTickCopyWith(
          RecoverTick value, $Res Function(RecoverTick) then) =
      _$RecoverTickCopyWithImpl<$Res>;
}

class _$RecoverTickCopyWithImpl<$Res> extends _$TimerEventCopyWithImpl<$Res>
    implements $RecoverTickCopyWith<$Res> {
  _$RecoverTickCopyWithImpl(
      RecoverTick _value, $Res Function(RecoverTick) _then)
      : super(_value, (v) => _then(v as RecoverTick));

  @override
  RecoverTick get _value => super._value as RecoverTick;
}

class _$RecoverTick with DiagnosticableTreeMixin implements RecoverTick {
  const _$RecoverTick();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerEvent.recoverTick()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'TimerEvent.recoverTick'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RecoverTick);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result setupTick(),
    @required Result runningTick(),
    @required Result recoverTick(),
    @required Result pause(),
    @required Result resume(),
    @required Result replay(),
  }) {
    assert(setupTick != null);
    assert(runningTick != null);
    assert(recoverTick != null);
    assert(pause != null);
    assert(resume != null);
    assert(replay != null);
    return recoverTick();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result setupTick(),
    Result runningTick(),
    Result recoverTick(),
    Result pause(),
    Result resume(),
    Result replay(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (recoverTick != null) {
      return recoverTick();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result setupTick(SetupTick value),
    @required Result runningTick(RunningTick value),
    @required Result recoverTick(RecoverTick value),
    @required Result pause(Pause value),
    @required Result resume(Resume value),
    @required Result replay(Replay value),
  }) {
    assert(setupTick != null);
    assert(runningTick != null);
    assert(recoverTick != null);
    assert(pause != null);
    assert(resume != null);
    assert(replay != null);
    return recoverTick(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result setupTick(SetupTick value),
    Result runningTick(RunningTick value),
    Result recoverTick(RecoverTick value),
    Result pause(Pause value),
    Result resume(Resume value),
    Result replay(Replay value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (recoverTick != null) {
      return recoverTick(this);
    }
    return orElse();
  }
}

abstract class RecoverTick implements TimerEvent {
  const factory RecoverTick() = _$RecoverTick;
}

abstract class $PauseCopyWith<$Res> {
  factory $PauseCopyWith(Pause value, $Res Function(Pause) then) =
      _$PauseCopyWithImpl<$Res>;
}

class _$PauseCopyWithImpl<$Res> extends _$TimerEventCopyWithImpl<$Res>
    implements $PauseCopyWith<$Res> {
  _$PauseCopyWithImpl(Pause _value, $Res Function(Pause) _then)
      : super(_value, (v) => _then(v as Pause));

  @override
  Pause get _value => super._value as Pause;
}

class _$Pause with DiagnosticableTreeMixin implements Pause {
  const _$Pause();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerEvent.pause()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'TimerEvent.pause'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Pause);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result setupTick(),
    @required Result runningTick(),
    @required Result recoverTick(),
    @required Result pause(),
    @required Result resume(),
    @required Result replay(),
  }) {
    assert(setupTick != null);
    assert(runningTick != null);
    assert(recoverTick != null);
    assert(pause != null);
    assert(resume != null);
    assert(replay != null);
    return pause();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result setupTick(),
    Result runningTick(),
    Result recoverTick(),
    Result pause(),
    Result resume(),
    Result replay(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (pause != null) {
      return pause();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result setupTick(SetupTick value),
    @required Result runningTick(RunningTick value),
    @required Result recoverTick(RecoverTick value),
    @required Result pause(Pause value),
    @required Result resume(Resume value),
    @required Result replay(Replay value),
  }) {
    assert(setupTick != null);
    assert(runningTick != null);
    assert(recoverTick != null);
    assert(pause != null);
    assert(resume != null);
    assert(replay != null);
    return pause(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result setupTick(SetupTick value),
    Result runningTick(RunningTick value),
    Result recoverTick(RecoverTick value),
    Result pause(Pause value),
    Result resume(Resume value),
    Result replay(Replay value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (pause != null) {
      return pause(this);
    }
    return orElse();
  }
}

abstract class Pause implements TimerEvent {
  const factory Pause() = _$Pause;
}

abstract class $ResumeCopyWith<$Res> {
  factory $ResumeCopyWith(Resume value, $Res Function(Resume) then) =
      _$ResumeCopyWithImpl<$Res>;
}

class _$ResumeCopyWithImpl<$Res> extends _$TimerEventCopyWithImpl<$Res>
    implements $ResumeCopyWith<$Res> {
  _$ResumeCopyWithImpl(Resume _value, $Res Function(Resume) _then)
      : super(_value, (v) => _then(v as Resume));

  @override
  Resume get _value => super._value as Resume;
}

class _$Resume with DiagnosticableTreeMixin implements Resume {
  const _$Resume();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerEvent.resume()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'TimerEvent.resume'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Resume);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result setupTick(),
    @required Result runningTick(),
    @required Result recoverTick(),
    @required Result pause(),
    @required Result resume(),
    @required Result replay(),
  }) {
    assert(setupTick != null);
    assert(runningTick != null);
    assert(recoverTick != null);
    assert(pause != null);
    assert(resume != null);
    assert(replay != null);
    return resume();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result setupTick(),
    Result runningTick(),
    Result recoverTick(),
    Result pause(),
    Result resume(),
    Result replay(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resume != null) {
      return resume();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result setupTick(SetupTick value),
    @required Result runningTick(RunningTick value),
    @required Result recoverTick(RecoverTick value),
    @required Result pause(Pause value),
    @required Result resume(Resume value),
    @required Result replay(Replay value),
  }) {
    assert(setupTick != null);
    assert(runningTick != null);
    assert(recoverTick != null);
    assert(pause != null);
    assert(resume != null);
    assert(replay != null);
    return resume(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result setupTick(SetupTick value),
    Result runningTick(RunningTick value),
    Result recoverTick(RecoverTick value),
    Result pause(Pause value),
    Result resume(Resume value),
    Result replay(Replay value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resume != null) {
      return resume(this);
    }
    return orElse();
  }
}

abstract class Resume implements TimerEvent {
  const factory Resume() = _$Resume;
}

abstract class $ReplayCopyWith<$Res> {
  factory $ReplayCopyWith(Replay value, $Res Function(Replay) then) =
      _$ReplayCopyWithImpl<$Res>;
}

class _$ReplayCopyWithImpl<$Res> extends _$TimerEventCopyWithImpl<$Res>
    implements $ReplayCopyWith<$Res> {
  _$ReplayCopyWithImpl(Replay _value, $Res Function(Replay) _then)
      : super(_value, (v) => _then(v as Replay));

  @override
  Replay get _value => super._value as Replay;
}

class _$Replay with DiagnosticableTreeMixin implements Replay {
  const _$Replay();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerEvent.replay()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'TimerEvent.replay'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Replay);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result setupTick(),
    @required Result runningTick(),
    @required Result recoverTick(),
    @required Result pause(),
    @required Result resume(),
    @required Result replay(),
  }) {
    assert(setupTick != null);
    assert(runningTick != null);
    assert(recoverTick != null);
    assert(pause != null);
    assert(resume != null);
    assert(replay != null);
    return replay();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result setupTick(),
    Result runningTick(),
    Result recoverTick(),
    Result pause(),
    Result resume(),
    Result replay(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (replay != null) {
      return replay();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result setupTick(SetupTick value),
    @required Result runningTick(RunningTick value),
    @required Result recoverTick(RecoverTick value),
    @required Result pause(Pause value),
    @required Result resume(Resume value),
    @required Result replay(Replay value),
  }) {
    assert(setupTick != null);
    assert(runningTick != null);
    assert(recoverTick != null);
    assert(pause != null);
    assert(resume != null);
    assert(replay != null);
    return replay(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result setupTick(SetupTick value),
    Result runningTick(RunningTick value),
    Result recoverTick(RecoverTick value),
    Result pause(Pause value),
    Result resume(Resume value),
    Result replay(Replay value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (replay != null) {
      return replay(this);
    }
    return orElse();
  }
}

abstract class Replay implements TimerEvent {
  const factory Replay() = _$Replay;
}
