import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Exercise with EquatableMixin {
  const Exercise(
      {this.name = '',
      @required this.interval,
      @required this.recover,
      @required this.laps,
      this.key});
  final String name;
  final Duration interval;
  final Duration recover;
  final int laps;

  final dynamic key;

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
    return 'Exercise {key: $key, name: $name, laps: $laps, interval: ${interval.inSeconds}, recover: ${recover.inSeconds}}';
  }

  @override
  List<Object> get props => [name, laps, key, interval, recover];
}
