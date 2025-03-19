## **📟 Simplest Calculator**

A **lightweight** Flutter package that provides basic arithmetic operations:  
✅ **Addition (`+`)**  
✅ **Subtraction (`-`)**  
✅ **Multiplication (`*`)**  
✅ **Division (`/`)** (with division-by-zero handling)  

---

## **🚀 Installation**

To use this package, add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  simplest_calculator: ^0.0.1
```

Then, run:

```sh
flutter pub get
```

Alternatively, if you want to use the latest version from GitHub:

```yaml
dependencies:
  simplest_calculator:
    git: https://github.com/roscoekerby/simplest_calculator.git
```

---

## **🛠 Usage**

Import the package:

```dart
import 'package:simplest_calculator/simplest_calculator.dart';

void main() {
  final calculator = SimplestCalculator();

  print(calculator.add(10, 5)); // 15
  print(calculator.subtract(10, 5)); // 5
  print(calculator.multiply(10, 5)); // 50
  print(calculator.divide(10, 5)); // 2.0

  // Handling division by zero
  try {
    print(calculator.divide(10, 0));
  } catch (e) {
    print(e); // Output: Cannot divide by zero
  }
}
```

---

## **📖 API Reference**

| Method       | Description                                       | Example Usage |
|-------------|---------------------------------------------------|--------------|
| `add(a, b)`  | Adds two numbers                                 | `calculator.add(2, 3) → 5` |
| `subtract(a, b)` | Subtracts second number from the first      | `calculator.subtract(5, 3) → 2` |
| `multiply(a, b)` | Multiplies two numbers                      | `calculator.multiply(4, 5) → 20` |
| `divide(a, b)` | Divides first number by the second (checks for division by zero) | `calculator.divide(10, 2) → 5.0` |

---

## **📂 Example Application**
An interactive example app is included. To run it:

```sh
cd example
flutter run
```

**Example UI Implementation:**
```dart
import 'package:flutter/material.dart';
import 'package:simplest_calculator/simplest_calculator.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  final SimplestCalculator calculator = SimplestCalculator();

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
  double num1 = 0, num2 = 0;
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
            result = double.nan;
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
```

---

## **🧪 Running Tests**
This package includes unit tests to verify functionality. To run tests:

```sh
flutter test
```

**Test file (`test/simplest_calculator_test.dart`):**
```dart
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
```

---

## **🛠 Contributing**
We welcome contributions! To contribute:

1. **Fork the repository**:  
   Click on the **Fork** button at the top-right corner of the repo.

2. **Clone the repository**:
   ```sh
   git clone https://github.com/roscoekerby/simplest_calculator.git
   cd simplest_calculator
   ```

3. **Create a new branch**:
   ```sh
   git checkout -b feature-yourfeature
   ```

4. **Make your changes** and commit:
   ```sh
   git add .
   git commit -m "Added a new feature"
   ```

5. **Push and open a Pull Request**:
   ```sh
   git push origin feature-yourfeature
   ```

---

## **📜 License**
This package is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## **📞 Contact**
- **Author:** Roscoe Kerby  
- **GitHub:** [roscoekerby](https://github.com/roscoekerby)  
- **Email:** [roscoe.kerby@gmail.com](mailto:roscoe.kerby@gmail.com)  

---

## **📌 Final Notes**
This package is designed to be minimalistic yet functional. Future updates may include:  
✅ **Scientific calculator operations** (exponents, square roots, logs)  
✅ **Support for fractions & decimals**  
✅ **Graphing functionalities**  

---

### **🎉 Enjoy Using `simplest_calculator`! 🚀**
