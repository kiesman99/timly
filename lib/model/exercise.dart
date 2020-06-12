import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'exercise.g.dart';

@HiveType(typeId: 0)
class Exercise extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  Duration interval;
  @HiveField(2)
  Duration recover;
  @HiveField(3)
  int laps;

  Exercise(
      {@required this.name,
      @required this.interval,
      @required this.recover,
      @required this.laps});

  Exercise copyWith(
      {String name, Duration interval, Duration recover, int laps}) {
    return Exercise(
        name: name ?? this.name,
        interval: interval ?? this.interval,
        recover: recover ?? this.recover,
        laps: laps ?? this.laps);
  }
}