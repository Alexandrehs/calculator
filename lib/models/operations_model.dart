import 'package:flutter/cupertino.dart';

class OperationsModel extends ChangeNotifier {
  double _result = 0;
  late String _digits;
  final bool _operator = true;
  bool _digitedOperator = false;
  late String _operatorSymbol;
  int _sizeDigitsOfFirstDigit = 0;
  double _firstDigitsForOperation = 0;
  double _secondDigitsForOperation = 0;
  static final List<String> _operators = ['+', '-', 'x', '÷'];

  OperationsModel(this._digits);

  String get digits => _digits;
  double get result => _result;
  double get firstDigit => _firstDigitsForOperation;
  bool get digitedOperator => _digitedOperator;

  add(String digit) {
    if (digit == '0' && _digits == '0') {
      return _digits;
    } else if (digit != '0' && _digits == '0') {
      _digits = digit;
      notifyListeners();
      _digitedOperator = false;
    }

    if (_digitedOperator && _operators.contains(digit)) {
      return;
    }

    _digits += digit;
    _digitedOperator = false;
    notifyListeners();
  }

  ac() {
    _digits = '0';
    notifyListeners();
  }

  operation(String operator) {
    if (!_digitedOperator) {
      if (_firstDigitsForOperation == 0) {
        _firstDigitsForOperation = double.parse(_digits.split(operator).first);
        _operatorSymbol = operator;
        _sizeDigitsOfFirstDigit = _digits.length;
        _digitedOperator = true;
        return;
      }
      if (_sizeDigitsOfFirstDigit > 0 && _firstDigitsForOperation != 0) {
        _secondDigitsForOperation = double.parse(
          _digits
              .substring(_sizeDigitsOfFirstDigit, _digits.length)
              .split(operator)
              .first,
        );

        switch (_operatorSymbol) {
          case '+':
            _result = (_firstDigitsForOperation + _secondDigitsForOperation);
            break;
          case '-':
            _result = (_firstDigitsForOperation - _secondDigitsForOperation);
            break;
          case 'x':
            _result = (_firstDigitsForOperation * _secondDigitsForOperation);
            break;
          case '÷':
            _result = (_firstDigitsForOperation / _secondDigitsForOperation);
            break;
        }

        if (operator == '=') {
          _digits = _result.toString();
          _operatorSymbol = '';
          _firstDigitsForOperation = 0;
          _sizeDigitsOfFirstDigit = 0;
          notifyListeners();
        }

        _sizeDigitsOfFirstDigit = _digits.length;
        _firstDigitsForOperation = _result;
        _operatorSymbol = operator;
        _digitedOperator = true;
        notifyListeners();
      }
    }
  }
}
