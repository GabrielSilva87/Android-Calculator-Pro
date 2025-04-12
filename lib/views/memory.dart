import 'dart:math';

class Memory {
  String _input = '';
  String _output = '';

  String get output => _output.isEmpty ? '0' : _output;

  void _clear() {
    _input = '';
    _output = '';
  }

  void _deleteEndDigit() {
    if (_input.isNotEmpty) {
      _input = _input.substring(0, _input.length - 1);
    }
  }

  void _addDigit(String digit) {
    _input += digit;
  }

  void _setOperation(String operation) {
    if (_input.isNotEmpty)
