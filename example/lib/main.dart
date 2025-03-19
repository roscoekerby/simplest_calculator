import 'package:flutter/material.dart';
import 'package:simplest_calculator/simplest_calculator.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  final SimplestCalculator calculator = SimplestCalculator();

  CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Simplest Calculator Example')),
        body: CalculatorScreen(calculator),
      ),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  final SimplestCalculator calculator;

  const CalculatorScreen(this.calculator, {Key? key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double num1 = 0;
  double num2 = 0;
  double? result;

  void calculate(String operation) {
    setState(() {
      switch (operation) {
        case '+':
          result = widget.calculator.add(num1, num2);
          break;
        case '-':
          result = widget.calculator.subtract(num1, num2);
          break;
        case '*':
          result = widget.calculator.multiply(num1, num2);
          break;
        case '/':
          try {
            result = widget.calculator.divide(num1, num2);
          } catch (e) {
            result = double.nan; // Handle division by zero
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: "Enter first number"),
            keyboardType: TextInputType.number,
            onChanged: (value) => num1 = double.tryParse(value) ?? 0,
          ),
          TextField(
            decoration: const InputDecoration(labelText: "Enter second number"),
            keyboardType: TextInputType.number,
            onChanged: (value) => num2 = double.tryParse(value) ?? 0,
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            children: ['+', '-', '*', '/'].map((op) {
              return ElevatedButton(
                onPressed: () => calculate(op),
                child: Text(op),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          Text(
            "Result: ${result ?? ''}",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
