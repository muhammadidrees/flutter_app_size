import 'package:counter/counter.dart';
import 'package:test/test.dart';

void main() {
  group('Counter', () {
    Counter createCounter(int? initialValue) => Counter(initialValue);

    group('initializes', () {
      test('with 0 if no value is passed', () {
        final counter = Counter();
        expect(counter.count, 0);
      });

      test('with other values', () {
        const value = 42;
        final counter = Counter(value);
        expect(counter.count, value);
      });
    });

    group('count', () {
      test('returns correct value', () {
        const value = 42;
        final counter = createCounter(value);
        expect(counter.count, value);
      });
    });

    group('increment', () {
      late Counter counter;

      setUp(() {
        counter = createCounter(0);
      });

      test('increments by 1', () {
        counter.increment();
        expect(counter.count, 1);
      });

      test('increments by 2', () {
        counter.increment();
        counter.increment();
        expect(counter.count, 2);
      });
    });

    group('toString', () {
      const input = 0;
      const output = '0';

      test('returns correct string', () {
        final counter = createCounter(input);
        expect(counter.toString(), output);
      });
    });
  });
}
