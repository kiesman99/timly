// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'persistence_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PersistenceEventTearOff {
  const _$PersistenceEventTearOff();

  LoadAll loadAll() {
    return const LoadAll();
  }

  Load load(Exercise exercise) {
    return Load(
      exercise,
    );
  }

  Add add(Exercise exercise) {
    return Add(
      exercise,
    );
  }

  Delete delete(Exercise exercise) {
    return Delete(
      exercise,
    );
  }

  DeleteAll deleteAll(List<Exercise> exercises) {
    return DeleteAll(
      exercises,
    );
  }

  Update update(Exercise exercise) {
    return Update(
      exercise,
    );
  }
}

// ignore: unused_element
const $PersistenceEvent = _$PersistenceEventTearOff();

mixin _$PersistenceEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loadAll(),
    @required Result load(Exercise exercise),
    @required Result add(Exercise exercise),
    @required Result delete(Exercise exercise),
    @required Result deleteAll(List<Exercise> exercises),
    @required Result update(Exercise exercise),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loadAll(),
    Result load(Exercise exercise),
    Result add(Exercise exercise),
    Result delete(Exercise exercise),
    Result deleteAll(List<Exercise> exercises),
    Result update(Exercise exercise),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loadAll(LoadAll value),
    @required Result load(Load value),
    @required Result add(Add value),
    @required Result delete(Delete value),
    @required Result deleteAll(DeleteAll value),
    @required Result update(Update value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loadAll(LoadAll value),
    Result load(Load value),
    Result add(Add value),
    Result delete(Delete value),
    Result deleteAll(DeleteAll value),
    Result update(Update value),
    @required Result orElse(),
  });
}

abstract class $PersistenceEventCopyWith<$Res> {
  factory $PersistenceEventCopyWith(
          PersistenceEvent value, $Res Function(PersistenceEvent) then) =
      _$PersistenceEventCopyWithImpl<$Res>;
}

class _$PersistenceEventCopyWithImpl<$Res>
    implements $PersistenceEventCopyWith<$Res> {
  _$PersistenceEventCopyWithImpl(this._value, this._then);

  final PersistenceEvent _value;
  // ignore: unused_field
  final $Res Function(PersistenceEvent) _then;
}

abstract class $LoadAllCopyWith<$Res> {
  factory $LoadAllCopyWith(LoadAll value, $Res Function(LoadAll) then) =
      _$LoadAllCopyWithImpl<$Res>;
}

class _$LoadAllCopyWithImpl<$Res> extends _$PersistenceEventCopyWithImpl<$Res>
    implements $LoadAllCopyWith<$Res> {
  _$LoadAllCopyWithImpl(LoadAll _value, $Res Function(LoadAll) _then)
      : super(_value, (v) => _then(v as LoadAll));

  @override
  LoadAll get _value => super._value as LoadAll;
}

class _$LoadAll with DiagnosticableTreeMixin implements LoadAll {
  const _$LoadAll();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PersistenceEvent.loadAll()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'PersistenceEvent.loadAll'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadAll);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loadAll(),
    @required Result load(Exercise exercise),
    @required Result add(Exercise exercise),
    @required Result delete(Exercise exercise),
    @required Result deleteAll(List<Exercise> exercises),
    @required Result update(Exercise exercise),
  }) {
    assert(loadAll != null);
    assert(load != null);
    assert(add != null);
    assert(delete != null);
    assert(deleteAll != null);
    assert(update != null);
    return loadAll();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loadAll(),
    Result load(Exercise exercise),
    Result add(Exercise exercise),
    Result delete(Exercise exercise),
    Result deleteAll(List<Exercise> exercises),
    Result update(Exercise exercise),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadAll != null) {
      return loadAll();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loadAll(LoadAll value),
    @required Result load(Load value),
    @required Result add(Add value),
    @required Result delete(Delete value),
    @required Result deleteAll(DeleteAll value),
    @required Result update(Update value),
  }) {
    assert(loadAll != null);
    assert(load != null);
    assert(add != null);
    assert(delete != null);
    assert(deleteAll != null);
    assert(update != null);
    return loadAll(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loadAll(LoadAll value),
    Result load(Load value),
    Result add(Add value),
    Result delete(Delete value),
    Result deleteAll(DeleteAll value),
    Result update(Update value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadAll != null) {
      return loadAll(this);
    }
    return orElse();
  }
}

abstract class LoadAll implements PersistenceEvent {
  const factory LoadAll() = _$LoadAll;
}

abstract class $LoadCopyWith<$Res> {
  factory $LoadCopyWith(Load value, $Res Function(Load) then) =
      _$LoadCopyWithImpl<$Res>;
  $Res call({Exercise exercise});
}

class _$LoadCopyWithImpl<$Res> extends _$PersistenceEventCopyWithImpl<$Res>
    implements $LoadCopyWith<$Res> {
  _$LoadCopyWithImpl(Load _value, $Res Function(Load) _then)
      : super(_value, (v) => _then(v as Load));

  @override
  Load get _value => super._value as Load;

  @override
  $Res call({
    Object exercise = freezed,
  }) {
    return _then(Load(
      exercise == freezed ? _value.exercise : exercise as Exercise,
    ));
  }
}

class _$Load with DiagnosticableTreeMixin implements Load {
  const _$Load(this.exercise) : assert(exercise != null);

  @override
  final Exercise exercise;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PersistenceEvent.load(exercise: $exercise)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PersistenceEvent.load'))
      ..add(DiagnosticsProperty('exercise', exercise));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Load &&
            (identical(other.exercise, exercise) ||
                const DeepCollectionEquality()
                    .equals(other.exercise, exercise)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(exercise);

  @override
  $LoadCopyWith<Load> get copyWith =>
      _$LoadCopyWithImpl<Load>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loadAll(),
    @required Result load(Exercise exercise),
    @required Result add(Exercise exercise),
    @required Result delete(Exercise exercise),
    @required Result deleteAll(List<Exercise> exercises),
    @required Result update(Exercise exercise),
  }) {
    assert(loadAll != null);
    assert(load != null);
    assert(add != null);
    assert(delete != null);
    assert(deleteAll != null);
    assert(update != null);
    return load(exercise);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loadAll(),
    Result load(Exercise exercise),
    Result add(Exercise exercise),
    Result delete(Exercise exercise),
    Result deleteAll(List<Exercise> exercises),
    Result update(Exercise exercise),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (load != null) {
      return load(exercise);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loadAll(LoadAll value),
    @required Result load(Load value),
    @required Result add(Add value),
    @required Result delete(Delete value),
    @required Result deleteAll(DeleteAll value),
    @required Result update(Update value),
  }) {
    assert(loadAll != null);
    assert(load != null);
    assert(add != null);
    assert(delete != null);
    assert(deleteAll != null);
    assert(update != null);
    return load(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loadAll(LoadAll value),
    Result load(Load value),
    Result add(Add value),
    Result delete(Delete value),
    Result deleteAll(DeleteAll value),
    Result update(Update value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class Load implements PersistenceEvent {
  const factory Load(Exercise exercise) = _$Load;

  Exercise get exercise;
  $LoadCopyWith<Load> get copyWith;
}

abstract class $AddCopyWith<$Res> {
  factory $AddCopyWith(Add value, $Res Function(Add) then) =
      _$AddCopyWithImpl<$Res>;
  $Res call({Exercise exercise});
}

class _$AddCopyWithImpl<$Res> extends _$PersistenceEventCopyWithImpl<$Res>
    implements $AddCopyWith<$Res> {
  _$AddCopyWithImpl(Add _value, $Res Function(Add) _then)
      : super(_value, (v) => _then(v as Add));

  @override
  Add get _value => super._value as Add;

  @override
  $Res call({
    Object exercise = freezed,
  }) {
    return _then(Add(
      exercise == freezed ? _value.exercise : exercise as Exercise,
    ));
  }
}

class _$Add with DiagnosticableTreeMixin implements Add {
  const _$Add(this.exercise) : assert(exercise != null);

  @override
  final Exercise exercise;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PersistenceEvent.add(exercise: $exercise)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PersistenceEvent.add'))
      ..add(DiagnosticsProperty('exercise', exercise));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Add &&
            (identical(other.exercise, exercise) ||
                const DeepCollectionEquality()
                    .equals(other.exercise, exercise)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(exercise);

  @override
  $AddCopyWith<Add> get copyWith => _$AddCopyWithImpl<Add>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loadAll(),
    @required Result load(Exercise exercise),
    @required Result add(Exercise exercise),
    @required Result delete(Exercise exercise),
    @required Result deleteAll(List<Exercise> exercises),
    @required Result update(Exercise exercise),
  }) {
    assert(loadAll != null);
    assert(load != null);
    assert(add != null);
    assert(delete != null);
    assert(deleteAll != null);
    assert(update != null);
    return add(exercise);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loadAll(),
    Result load(Exercise exercise),
    Result add(Exercise exercise),
    Result delete(Exercise exercise),
    Result deleteAll(List<Exercise> exercises),
    Result update(Exercise exercise),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (add != null) {
      return add(exercise);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loadAll(LoadAll value),
    @required Result load(Load value),
    @required Result add(Add value),
    @required Result delete(Delete value),
    @required Result deleteAll(DeleteAll value),
    @required Result update(Update value),
  }) {
    assert(loadAll != null);
    assert(load != null);
    assert(add != null);
    assert(delete != null);
    assert(deleteAll != null);
    assert(update != null);
    return add(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loadAll(LoadAll value),
    Result load(Load value),
    Result add(Add value),
    Result delete(Delete value),
    Result deleteAll(DeleteAll value),
    Result update(Update value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class Add implements PersistenceEvent {
  const factory Add(Exercise exercise) = _$Add;

  Exercise get exercise;
  $AddCopyWith<Add> get copyWith;
}

abstract class $DeleteCopyWith<$Res> {
  factory $DeleteCopyWith(Delete value, $Res Function(Delete) then) =
      _$DeleteCopyWithImpl<$Res>;
  $Res call({Exercise exercise});
}

class _$DeleteCopyWithImpl<$Res> extends _$PersistenceEventCopyWithImpl<$Res>
    implements $DeleteCopyWith<$Res> {
  _$DeleteCopyWithImpl(Delete _value, $Res Function(Delete) _then)
      : super(_value, (v) => _then(v as Delete));

  @override
  Delete get _value => super._value as Delete;

  @override
  $Res call({
    Object exercise = freezed,
  }) {
    return _then(Delete(
      exercise == freezed ? _value.exercise : exercise as Exercise,
    ));
  }
}

class _$Delete with DiagnosticableTreeMixin implements Delete {
  const _$Delete(this.exercise) : assert(exercise != null);

  @override
  final Exercise exercise;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PersistenceEvent.delete(exercise: $exercise)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PersistenceEvent.delete'))
      ..add(DiagnosticsProperty('exercise', exercise));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Delete &&
            (identical(other.exercise, exercise) ||
                const DeepCollectionEquality()
                    .equals(other.exercise, exercise)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(exercise);

  @override
  $DeleteCopyWith<Delete> get copyWith =>
      _$DeleteCopyWithImpl<Delete>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loadAll(),
    @required Result load(Exercise exercise),
    @required Result add(Exercise exercise),
    @required Result delete(Exercise exercise),
    @required Result deleteAll(List<Exercise> exercises),
    @required Result update(Exercise exercise),
  }) {
    assert(loadAll != null);
    assert(load != null);
    assert(add != null);
    assert(delete != null);
    assert(deleteAll != null);
    assert(update != null);
    return delete(exercise);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loadAll(),
    Result load(Exercise exercise),
    Result add(Exercise exercise),
    Result delete(Exercise exercise),
    Result deleteAll(List<Exercise> exercises),
    Result update(Exercise exercise),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (delete != null) {
      return delete(exercise);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loadAll(LoadAll value),
    @required Result load(Load value),
    @required Result add(Add value),
    @required Result delete(Delete value),
    @required Result deleteAll(DeleteAll value),
    @required Result update(Update value),
  }) {
    assert(loadAll != null);
    assert(load != null);
    assert(add != null);
    assert(delete != null);
    assert(deleteAll != null);
    assert(update != null);
    return delete(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loadAll(LoadAll value),
    Result load(Load value),
    Result add(Add value),
    Result delete(Delete value),
    Result deleteAll(DeleteAll value),
    Result update(Update value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class Delete implements PersistenceEvent {
  const factory Delete(Exercise exercise) = _$Delete;

  Exercise get exercise;
  $DeleteCopyWith<Delete> get copyWith;
}

abstract class $DeleteAllCopyWith<$Res> {
  factory $DeleteAllCopyWith(DeleteAll value, $Res Function(DeleteAll) then) =
      _$DeleteAllCopyWithImpl<$Res>;
  $Res call({List<Exercise> exercises});
}

class _$DeleteAllCopyWithImpl<$Res> extends _$PersistenceEventCopyWithImpl<$Res>
    implements $DeleteAllCopyWith<$Res> {
  _$DeleteAllCopyWithImpl(DeleteAll _value, $Res Function(DeleteAll) _then)
      : super(_value, (v) => _then(v as DeleteAll));

  @override
  DeleteAll get _value => super._value as DeleteAll;

  @override
  $Res call({
    Object exercises = freezed,
  }) {
    return _then(DeleteAll(
      exercises == freezed ? _value.exercises : exercises as List<Exercise>,
    ));
  }
}

class _$DeleteAll with DiagnosticableTreeMixin implements DeleteAll {
  const _$DeleteAll(this.exercises) : assert(exercises != null);

  @override
  final List<Exercise> exercises;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PersistenceEvent.deleteAll(exercises: $exercises)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PersistenceEvent.deleteAll'))
      ..add(DiagnosticsProperty('exercises', exercises));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeleteAll &&
            (identical(other.exercises, exercises) ||
                const DeepCollectionEquality()
                    .equals(other.exercises, exercises)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(exercises);

  @override
  $DeleteAllCopyWith<DeleteAll> get copyWith =>
      _$DeleteAllCopyWithImpl<DeleteAll>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loadAll(),
    @required Result load(Exercise exercise),
    @required Result add(Exercise exercise),
    @required Result delete(Exercise exercise),
    @required Result deleteAll(List<Exercise> exercises),
    @required Result update(Exercise exercise),
  }) {
    assert(loadAll != null);
    assert(load != null);
    assert(add != null);
    assert(delete != null);
    assert(deleteAll != null);
    assert(update != null);
    return deleteAll(exercises);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loadAll(),
    Result load(Exercise exercise),
    Result add(Exercise exercise),
    Result delete(Exercise exercise),
    Result deleteAll(List<Exercise> exercises),
    Result update(Exercise exercise),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (deleteAll != null) {
      return deleteAll(exercises);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loadAll(LoadAll value),
    @required Result load(Load value),
    @required Result add(Add value),
    @required Result delete(Delete value),
    @required Result deleteAll(DeleteAll value),
    @required Result update(Update value),
  }) {
    assert(loadAll != null);
    assert(load != null);
    assert(add != null);
    assert(delete != null);
    assert(deleteAll != null);
    assert(update != null);
    return deleteAll(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loadAll(LoadAll value),
    Result load(Load value),
    Result add(Add value),
    Result delete(Delete value),
    Result deleteAll(DeleteAll value),
    Result update(Update value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (deleteAll != null) {
      return deleteAll(this);
    }
    return orElse();
  }
}

abstract class DeleteAll implements PersistenceEvent {
  const factory DeleteAll(List<Exercise> exercises) = _$DeleteAll;

  List<Exercise> get exercises;
  $DeleteAllCopyWith<DeleteAll> get copyWith;
}

abstract class $UpdateCopyWith<$Res> {
  factory $UpdateCopyWith(Update value, $Res Function(Update) then) =
      _$UpdateCopyWithImpl<$Res>;
  $Res call({Exercise exercise});
}

class _$UpdateCopyWithImpl<$Res> extends _$PersistenceEventCopyWithImpl<$Res>
    implements $UpdateCopyWith<$Res> {
  _$UpdateCopyWithImpl(Update _value, $Res Function(Update) _then)
      : super(_value, (v) => _then(v as Update));

  @override
  Update get _value => super._value as Update;

  @override
  $Res call({
    Object exercise = freezed,
  }) {
    return _then(Update(
      exercise == freezed ? _value.exercise : exercise as Exercise,
    ));
  }
}

class _$Update with DiagnosticableTreeMixin implements Update {
  const _$Update(this.exercise) : assert(exercise != null);

  @override
  final Exercise exercise;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PersistenceEvent.update(exercise: $exercise)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PersistenceEvent.update'))
      ..add(DiagnosticsProperty('exercise', exercise));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Update &&
            (identical(other.exercise, exercise) ||
                const DeepCollectionEquality()
                    .equals(other.exercise, exercise)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(exercise);

  @override
  $UpdateCopyWith<Update> get copyWith =>
      _$UpdateCopyWithImpl<Update>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loadAll(),
    @required Result load(Exercise exercise),
    @required Result add(Exercise exercise),
    @required Result delete(Exercise exercise),
    @required Result deleteAll(List<Exercise> exercises),
    @required Result update(Exercise exercise),
  }) {
    assert(loadAll != null);
    assert(load != null);
    assert(add != null);
    assert(delete != null);
    assert(deleteAll != null);
    assert(update != null);
    return update(exercise);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loadAll(),
    Result load(Exercise exercise),
    Result add(Exercise exercise),
    Result delete(Exercise exercise),
    Result deleteAll(List<Exercise> exercises),
    Result update(Exercise exercise),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (update != null) {
      return update(exercise);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loadAll(LoadAll value),
    @required Result load(Load value),
    @required Result add(Add value),
    @required Result delete(Delete value),
    @required Result deleteAll(DeleteAll value),
    @required Result update(Update value),
  }) {
    assert(loadAll != null);
    assert(load != null);
    assert(add != null);
    assert(delete != null);
    assert(deleteAll != null);
    assert(update != null);
    return update(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loadAll(LoadAll value),
    Result load(Load value),
    Result add(Add value),
    Result delete(Delete value),
    Result deleteAll(DeleteAll value),
    Result update(Update value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class Update implements PersistenceEvent {
  const factory Update(Exercise exercise) = _$Update;

  Exercise get exercise;
  $UpdateCopyWith<Update> get copyWith;
}
