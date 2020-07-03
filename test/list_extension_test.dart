import 'package:flutter_test/flutter_test.dart';
import 'package:timly/utils/list_utils.dart';

void main() {
  test('ShiftRight', () {
    List<int> list = [1, 2, 3, 4];
    List<int> newList = shiftRight(list);
    expect(newList, [0, 1, 2, 3]);
    expect(newList.length, 4);
  });

  test('ShiftLeft', () {
    List<int> list = [1, 2, 3, 4];
    List<int> newList = shiftLeft(list);
    expect(newList, [2, 3, 4, 0]);
    expect(newList.length, 4);
  });
}
