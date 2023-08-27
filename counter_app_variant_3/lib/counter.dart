class Counter {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
  }

  @override
  String toString() => "$_count";
}
