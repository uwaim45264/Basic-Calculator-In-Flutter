import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  double _result = 0.0;

  void _calculate(String operation) {
    double num1 = double.tryParse(_controller1.text) ?? 0.0;
    double num2 = double.tryParse(_controller2.text) ?? 0.0;

    setState(() {
      switch (operation) {
        case 'add':
          _result = num1 + num2;
          break;
        case 'subtract':
          _result = num1 - num2;
          break;
        case 'multiply':
          _result = num1 * num2;
          break;
        case 'divide':
          _result = num2 != 0 ? num1 / num2 : double.infinity;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Basic Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter first number'),
            ),
            TextField(
              controller: _controller2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter second number'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _calculate('add'),
                  child: Icon(Icons.add),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('subtract'),
                  child: Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('multiply'),
                  child: Text('×'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('divide'),
                  child: Text('÷'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Result: ${_result.isFinite ? _result.toStringAsFixed(2) : "Error"}',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}