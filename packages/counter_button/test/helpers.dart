import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MockVoidCallback {
  int callCount = 0;

  void call() {
    callCount++;
  }

  bool verifyCallCount(int expected) {
    return callCount == expected;
  }
}

extension CounterButtonTester on WidgetTester {
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
