import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'exercise.g.dart';

@HiveType(typeId: 0)
class Exercise extends HiveObject with EquatableMixin {
  @HiveField(0)
  String name;
  @HiveField(1)
  Duration interval;
  @HiveField(2)
  Duration recover;
  @HiveField(3)
  int laps;

  dynamic key;

  Exercise(
      {this.name = "",
      @required this.interval,
      @required this.recover,
      @required this.laps,
      this.key}) {
    this.key = super.key;
  }

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
    return "Exercise {name: $name, laps: $laps, interval: ${interval.inSeconds}, recover: ${recover.inSeconds}}";
  }

  @override
  List<Object> get props => [name, laps, key, interval, recover];
}
