import 'package:flutter_test/flutter_test.dart';
import 'package:simplest_calculator/simplest_calculator.dart';

void main() {
  final calculator = SimplestCalculator();

  test('Addition works correctly', () {
    expect(calculator.add(2, 3), 5);
    expect(calculator.add(-2, -3), -5);
  });

  test('Subtraction works correctly', () {
    expect(calculator.subtract(5, 3), 2);
    expect(calculator.subtract(3, 5), -2);
  });

  test('Multiplication works correctly', () {
    expect(calculator.multiply(2, 3), 6);
    expect(calculator.multiply(-2, 3), -6);
  });

  test('Division works correctly', () {
    expect(calculator.divide(6, 3), 2);
    expect(calculator.divide(-6, 3), -2);
  });

  test('Division by zero throws an error', () {
    expect(() => calculator.divide(6, 0), throwsArgumentError);
  });
}
