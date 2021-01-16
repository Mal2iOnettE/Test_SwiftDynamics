import 'package:flutter/material.dart';

class Caculator extends StatefulWidget {
  @override
  _CaculatorState createState() => _CaculatorState();
}

class _CaculatorState extends State<Caculator> {
  String displayNum = '0';
  String calcNum = '';
  String operationSymbol = '';
  double result;
  String num1;
  bool shouldCalculate = false;

  void _pressButton(String buttonText) {
    setState(() {
      // number += buttonText.split('+');
      switch (buttonText) {
        case '+':
          if (shouldCalculate) {
            _calculate();
            //operationSymbol = '+';
          } else {
            result = double.tryParse(calcNum) ?? 0;
            shouldCalculate = true;
          }
          calcNum = '';
          operationSymbol = buttonText;
          break;
        case '-':
          if (shouldCalculate) {
            _calculate();
            //operationSymbol = '-';
          } else {
            result = double.tryParse(calcNum) ?? 0;
            shouldCalculate = true;
          }
          calcNum = '';
          operationSymbol = buttonText;
          break;
        case 'x':
          if (shouldCalculate) {
            _calculate();
            //operationSymbol = 'x';
          } else {
            result = double.tryParse(calcNum) ?? 0;
            shouldCalculate = true;
          }
          calcNum = '';
          operationSymbol = buttonText;
          break;
        case '÷':
          if (shouldCalculate) {
            _calculate();
            //operationSymbol = '÷';
          } else {
            result = double.tryParse(calcNum) ?? 0;
            shouldCalculate = true;
          }
          calcNum = '';
          operationSymbol = buttonText;

          break;
        case '%':
          result = double.tryParse(calcNum) / 100;
          calcNum = '';
          operationSymbol = '%';
          shouldCalculate = false;

          break;
        case '=':
          _calculate();
          operationSymbol = '=';
          shouldCalculate = false;
          break;
        case 'C':
          calcNum = '';
          displayNum = '0';
          operationSymbol = '';
          result = 0;
          shouldCalculate = false;
          break;

        default:
          calcNum += buttonText;
          displayNum = calcNum;
        // num1 = calcNum;
      }
    });
  }

  void _calculate() {
    switch (operationSymbol) {
      case '+':
        result += double.tryParse(calcNum) ?? 0;
        break;
      case '-':
        result -= double.tryParse(calcNum) ?? 0;
        break;
      case 'x':
        result *= double.tryParse(calcNum) ?? 0;
        break;
      case '÷':
        result /= double.tryParse(calcNum) ?? 0;
        break;

        // result = percentage;
        break;
      default:
        break;
    }
    if (result.isNaN) result = 0;
    calcNum = result.toString();
    displayNum = calcNum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 300.0,
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    displayNum,
                    style: Theme.of(context).textTheme.headline1,
                  )),
            ),
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    _buttonRow('C', '', '%', '÷'),
                    _buttonRow('7', '8', '9', 'x'),
                    _buttonRow('4', '5', '6', '-'),
                    _buttonRow('1', '2', '3', '+'),
                    _buttonRow('', '0', '.', '='),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget _calcuButton(String buttonText) {
    return Expanded(
      child: ButtonTheme(
        height: double.infinity,
        child: OutlineButton(
          onPressed: () => {_pressButton(buttonText)},
          child: Text(buttonText, style: Theme.of(context).textTheme.headline3),
          splashColor: Theme.of(context).primaryColor.withOpacity(0.1),
          borderSide: BorderSide(
            color: Theme.of(context).accentColor.withOpacity(0.05),
          ),
          highlightedBorderColor: Theme.of(context).primaryColor.withOpacity(0.1),
        ),
      ),
    );
  }

  Widget _buttonRow(String firstButton, String secondButton, String thirdButton, String fourthButton) {
    return Expanded(
      child: Row(
        children: <Widget>[
          _calcuButton(firstButton),
          _calcuButton(secondButton),
          _calcuButton(thirdButton),
          _calcuButton(fourthButton),
        ],
      ),
    );
  }
}
