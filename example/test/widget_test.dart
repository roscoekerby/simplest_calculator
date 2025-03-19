import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:example/main.dart';

void main() {
  testWidgets('Calculator operations work correctly',
      (WidgetTester tester) async {
    // Build the widget tree
    await tester.pumpWidget(CalculatorApp());

    // Find input fields
    final firstNumberField = find.byType(TextField).first;
    final secondNumberField = find.byType(TextField).last;

    // Enter first number
    await tester.enterText(firstNumberField, '10');
    await tester.pump();

    // Enter second number
    await tester.enterText(secondNumberField, '5');
    await tester.pump();

    // Test Addition
    await tester.tap(find.text('+'));
    await tester.pump();
    expect(find.text('Result: 15.0'), findsOneWidget);

    // Test Subtraction
    await tester.tap(find.text('-'));
    await tester.pump();
    expect(find.text('Result: 5.0'), findsOneWidget);

    // Test Multiplication
    await tester.tap(find.text('*'));
    await tester.pump();
    expect(find.text('Result: 50.0'), findsOneWidget);

    // Test Division
    await tester.tap(find.text('/'));
    await tester.pump();
    expect(find.text('Result: 2.0'), findsOneWidget);

    // Test Division by zero
    await tester.enterText(secondNumberField, '0');
    await tester.tap(find.text('/'));
    await tester.pump();
    expect(find.text('Result: NaN'), findsOneWidget);
  });
}
