class Pair<F, S> {
  final F first;
  final S second;

  Pair({required this.first, required this.second});

  @override
  String toString() {
    return '[${first.toString()}, ${second.toString()}]';
  }
}
