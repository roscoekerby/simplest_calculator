library simplest_calculator;

/// A simple calculator that supports basic arithmetic operations.
class SimplestCalculator {
  /// Adds two numbers.
  double add(double a, double b) => a + b;

  /// Subtracts [b] from [a].
  double subtract(double a, double b) => a - b;

  /// Multiplies two numbers.
  double multiply(double a, double b) => a * b;

  /// Divides [a] by [b]. Throws an [ArgumentError] if [b] is zero.
  double divide(double a, double b) {
    if (b == 0) {
      throw ArgumentError('Cannot divide by zero');
    }
    return a / b;
  }
}
