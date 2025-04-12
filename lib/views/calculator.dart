import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'memory.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final Memory memory = Memory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora Avançada'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildDisplay(),
          _buildKeyboard(),
        ],
      ),
    );
  }

  Widget _buildDisplay() {
    return Container(
      padding: EdgeInsets.all(24),
      alignment: Alignment.centerRight,
      child: AutoSizeText(
        memory.output,
        style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        maxLines: 1,
      ),
    );
  }

  Widget _buildKeyboard() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildKeyboardButton('7'),
            _buildKeyboardButton('8'),
            _buildKeyboardButton('9'),
            _buildKeyboardButton('/'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildKeyboardButton('4'),
            _buildKeyboardButton('5'),
            _buildKeyboardButton('6'),
            _buildKeyboardButton('*'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildKeyboardButton('1'),
            _buildKeyboardButton('2'),
            _buildKeyboardButton('3'),
            _buildKeyboardButton('-'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildKeyboardButton('0'),
            _buildKeyboardButton('C'), // Clear
            _buildKeyboardButton('='),
            _buildKeyboardButton('+'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildKeyboardButton('√'), // Raiz quadrada
            _buildKeyboardButton('sin'), // Seno
            _buildKeyboardButton('cos'), // Cosseno
            _buildKeyboardButton('tg'), // Tangente
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildKeyboardButton('^'), // Potência
          ],
        ),
      ],
    );
  }

  Widget _buildKeyboardButton(String label) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          memory.applyCommand(label);
        });
      },
      child: Text(label, style: TextStyle(fontSize: 24)),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(20),
        shape: CircleBorder(),
      ),
    );
  }
}
