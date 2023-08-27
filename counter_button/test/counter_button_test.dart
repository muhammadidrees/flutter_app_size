import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers.dart';

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
