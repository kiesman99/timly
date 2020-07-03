import 'package:flutter_test/flutter_test.dart';
import 'package:timly/utils/list_utils.dart';

void main() {
  group('ShiftRightTests', () {
    test('trivial', () {
      List<int> list = [1, 2, 3, 4];
      List<int> newList = shiftRight(list);
      expect(newList, [0, 1, 2, 3]);
      expect(newList.length, 4);
    });

    test('upperbound', () {
      List<int> list = List.generate(100000, (index) => index + 1);
      List<int> newList = shiftRight(list);
      expect(newList[0], 0);
      expect(
          newList.sublist(1), List.generate(100000 - 1, (index) => index + 1));
      expect(newList.length, 100000);
    });

    test('lowerbound', () {
      List<int> list = [1];
      List<int> newList = shiftRight(list);
      expect(newList, [0]);
      expect(newList.length, 1);
    });

    test('empty', () {
      List<int> list = [];
      List<int> newList = shiftRight(list);
      expect(newList, []);
      expect(newList.length, 0);
    });
  });

  group('ShiftLeftTests', () {
    test('trivial', () {
      List<int> list = [1, 2, 3, 4];
      List<int> newList = shiftLeft(list);
      expect(newList, [2, 3, 4, 0]);
      expect(newList.length, 4);
    });

    test('upperbound', () {
      List<int> list = List.generate(100000, (index) => index + 1);
      List<int> newList = shiftLeft(list);
      expect(newList.last, 0);
      expect(newList.sublist(0, 100000 - 1),
          List.generate(100000, (index) => index + 1).sublist(1));
      expect(newList.length, 100000);
    });

    test('lowerbound', () {
      List<int> list = [1];
      List<int> newList = shiftLeft(list);
      expect(newList, [0]);
      expect(newList.length, 1);
    });

    test('empty', () {
      List<int> list = [];
      List<int> newList = shiftLeft(list);
      expect(newList, []);
      expect(newList.length, 0);
    });
  });
}
