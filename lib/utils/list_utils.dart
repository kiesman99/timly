List<int> shiftRight(List<int> list) {
  if (list.isEmpty) {
    return [];
  }

  return list
    ..removeLast()
    ..insert(0, 0);
}

List<int> shiftLeft(List<int> list) {
  if (list.isEmpty) {
    return [];
  }

  return list
    ..removeAt(0)
    ..add(0);
}
