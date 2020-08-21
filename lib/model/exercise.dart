import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'exercise.g.dart';

@HiveType(typeId: 0)
class Exercise extends HiveObject with EquatableMixin {
  @HiveField(1)
  String name;
  @HiveField(2)
  Duration interval;
  @HiveField(3)
  Duration recover;
  @HiveField(4)
  int laps;

  dynamic key;

  Exercise(
      {this.name = "",
      @required this.interval,
      @required this.recover,
      @required this.laps,
      this.key});

  Exercise copyWith(
      {String name,
      Duration interval,
      Duration recover,
      int laps,
      dynamic key}) {
    return Exercise(
        name: name ?? this.name,
        interval: interval ?? this.interval,
        recover: recover ?? this.recover,
        laps: laps ?? this.laps,
        key: key ?? this.key);
  }

  @override
  String toString() {
    return "Exercise {key: $key, name: $name, laps: $laps, interval: ${interval.inSeconds}, recover: ${recover.inSeconds}}";
  }

  @override
  List<Object> get props => [name, laps, key, interval, recover];
}
