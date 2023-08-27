import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:counter_button/counter_button.dart';

class MockVoidCallback {
  int callCount = 0;

  void call() {
    callCount++;
  }

  bool verifyCallCount(int expected) {
    return callCount == expected;
  }
}

extension on WidgetTester {
  Future<void> pumpCounterButton(
    MockVoidCallback onPressed,
  ) async {
    await pumpWidget(
      MaterialApp(
        home: CounterButton(
          onPressed: onPressed,
        ),
      ),
    );
  }

  Future<void> tapCounterButton() async {
    await tap(find.byIcon(Icons.add));
  }
}

void main() {
  late MockVoidCallback onPressed;

  setUp(() {
    onPressed = MockVoidCallback();
  });

  group('CounterButton', () {
    group('renders', () {
      testWidgets('with add icon', (tester) async {
        await tester.pumpCounterButton(onPressed);
        expect(find.byIcon(Icons.add), findsOneWidget);
      });
    });

    group('calls', () {
      testWidgets('onPressed when tapped', (tester) async {
        await tester.pumpCounterButton(onPressed);
        await tester.tapCounterButton();

        expect(onPressed.verifyCallCount(1), isTrue);
      });
    });
  });
}
