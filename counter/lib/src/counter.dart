class Counter {
  Counter([int? count]) : _count = count ?? 0;

  int _count;

  int get count => _count;

  void increment() {
    _count++;
  }

  @override
  String toString() => '$_count';
}
