import 'package:hive/hive.dart';

class DurationTypeAdapter extends TypeAdapter<Duration> {
  @override
  Duration read(BinaryReader reader) {
    return Duration(microseconds: reader.readInt());
  }

  @override
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, Duration obj) {
    writer.writeInt(obj.inMicroseconds);
  }
}
