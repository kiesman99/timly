List<int> shiftRight(List<int> list) {
  return list
    ..removeLast()
    ..insert(0, 0);
}

List<int> shiftLeft(List<int> list) {
  return list
    ..removeAt(0)
    ..add(0);
}
