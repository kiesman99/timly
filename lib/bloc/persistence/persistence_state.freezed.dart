// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'persistence_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PersistenceStateTearOff {
  const _$PersistenceStateTearOff();

  Error error() {
    return const Error();
  }

  Init init() {
    return const Init();
  }

  Loaded loaded(List<Exercise> exercises) {
    return Loaded(
      exercises,
    );
  }
}

// ignore: unused_element
const $PersistenceState = _$PersistenceStateTearOff();

mixin _$PersistenceState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result error(),
    @required Result init(),
    @required Result loaded(List<Exercise> exercises),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result error(),
    Result init(),
    Result loaded(List<Exercise> exercises),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result error(Error value),
    @required Result init(Init value),
    @required Result loaded(Loaded value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result error(Error value),
    Result init(Init value),
    Result loaded(Loaded value),
    @required Result orElse(),
  });
}

abstract class $PersistenceStateCopyWith<$Res> {
  factory $PersistenceStateCopyWith(
          PersistenceState value, $Res Function(PersistenceState) then) =
      _$PersistenceStateCopyWithImpl<$Res>;
}

class _$PersistenceStateCopyWithImpl<$Res>
    implements $PersistenceStateCopyWith<$Res> {
  _$PersistenceStateCopyWithImpl(this._value, this._then);

  final PersistenceState _value;
  // ignore: unused_field
  final $Res Function(PersistenceState) _then;
}

abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res>;
}

class _$ErrorCopyWithImpl<$Res> extends _$PersistenceStateCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(Error _value, $Res Function(Error) _then)
      : super(_value, (v) => _then(v as Error));

  @override
  Error get _value => super._value as Error;
}

class _$Error with DiagnosticableTreeMixin implements Error {
  const _$Error();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PersistenceState.error()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'PersistenceState.error'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Error);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result error(),
    @required Result init(),
    @required Result loaded(List<Exercise> exercises),
  }) {
    assert(error != null);
    assert(init != null);
    assert(loaded != null);
    return error();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result error(),
    Result init(),
    Result loaded(List<Exercise> exercises),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result error(Error value),
    @required Result init(Init value),
    @required Result loaded(Loaded value),
  }) {
    assert(error != null);
    assert(init != null);
    assert(loaded != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result error(Error value),
    Result init(Init value),
    Result loaded(Loaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements PersistenceState {
  const factory Error() = _$Error;
}

abstract class $InitCopyWith<$Res> {
  factory $InitCopyWith(Init value, $Res Function(Init) then) =
      _$InitCopyWithImpl<$Res>;
}

class _$InitCopyWithImpl<$Res> extends _$PersistenceStateCopyWithImpl<$Res>
    implements $InitCopyWith<$Res> {
  _$InitCopyWithImpl(Init _value, $Res Function(Init) _then)
      : super(_value, (v) => _then(v as Init));

  @override
  Init get _value => super._value as Init;
}

class _$Init with DiagnosticableTreeMixin implements Init {
  const _$Init();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PersistenceState.init()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'PersistenceState.init'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Init);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result error(),
    @required Result init(),
    @required Result loaded(List<Exercise> exercises),
  }) {
    assert(error != null);
    assert(init != null);
    assert(loaded != null);
    return init();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result error(),
    Result init(),
    Result loaded(List<Exercise> exercises),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result error(Error value),
    @required Result init(Init value),
    @required Result loaded(Loaded value),
  }) {
    assert(error != null);
    assert(init != null);
    assert(loaded != null);
    return init(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result error(Error value),
    Result init(Init value),
    Result loaded(Loaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class Init implements PersistenceState {
  const factory Init() = _$Init;
}

abstract class $LoadedCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) then) =
      _$LoadedCopyWithImpl<$Res>;
  $Res call({List<Exercise> exercises});
}

class _$LoadedCopyWithImpl<$Res> extends _$PersistenceStateCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(Loaded _value, $Res Function(Loaded) _then)
      : super(_value, (v) => _then(v as Loaded));

  @override
  Loaded get _value => super._value as Loaded;

  @override
  $Res call({
    Object exercises = freezed,
  }) {
    return _then(Loaded(
      exercises == freezed ? _value.exercises : exercises as List<Exercise>,
    ));
  }
}

class _$Loaded with DiagnosticableTreeMixin implements Loaded {
  const _$Loaded(this.exercises) : assert(exercises != null);

  @override
  final List<Exercise> exercises;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PersistenceState.loaded(exercises: $exercises)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PersistenceState.loaded'))
      ..add(DiagnosticsProperty('exercises', exercises));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Loaded &&
            (identical(other.exercises, exercises) ||
                const DeepCollectionEquality()
                    .equals(other.exercises, exercises)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(exercises);

  @override
  $LoadedCopyWith<Loaded> get copyWith =>
      _$LoadedCopyWithImpl<Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result error(),
    @required Result init(),
    @required Result loaded(List<Exercise> exercises),
  }) {
    assert(error != null);
    assert(init != null);
    assert(loaded != null);
    return loaded(exercises);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result error(),
    Result init(),
    Result loaded(List<Exercise> exercises),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(exercises);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result error(Error value),
    @required Result init(Init value),
    @required Result loaded(Loaded value),
  }) {
    assert(error != null);
    assert(init != null);
    assert(loaded != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result error(Error value),
    Result init(Init value),
    Result loaded(Loaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded implements PersistenceState {
  const factory Loaded(List<Exercise> exercises) = _$Loaded;

  List<Exercise> get exercises;
  $LoadedCopyWith<Loaded> get copyWith;
}
