import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _txt = "0";
  String _previoustxt = "0";
  String _updatedExpression = "0";
  String _evaluatedtxt = "";
  var _startingZero = true;
  var clr = false;
  var expressions = ["+", "-", "%", "÷", "×", "."];

  void updateResults(_pressedtxt) {
    setState(() {
      if (_pressedtxt == '⌫') {
        _txt = _txt.substring(0, _txt.length - 1);
        _previoustxt = _txt[_txt.length - 1];
        print(_previoustxt);
        print(_txt);
      } else if (_pressedtxt == 'AC') {
        _txt = "0";
        _previoustxt = "0";
        _updatedExpression = "0";
        _startingZero = true;
      } else if (_pressedtxt == '=') {
        _evaluatedtxt = _txt;
        int _updatedanswer = 0;
        _evaluatedtxt = _evaluatedtxt.replaceAll('×', '*');
        _evaluatedtxt = _evaluatedtxt.replaceAll('÷', '/');
        Parser p = Parser();
        Expression exp = p.parse(_evaluatedtxt);
        ContextModel cm = ContextModel();
        double eval = exp.evaluate(EvaluationType.REAL, cm);
        if (eval % 1 == 0 || eval % 1 == 0.0) {
          _updatedanswer = eval.toInt();
          _updatedExpression = _updatedanswer.toString();
        } else {
          _updatedExpression = eval.toString();
        }
      } else if (_previoustxt == "" && _pressedtxt == "0") {
        _txt = "0";
        _previoustxt = _pressedtxt;
        clr = true;
      } else if (_previoustxt == "0" && _pressedtxt != "0" && _startingZero) {
        _txt = "" + _pressedtxt;
        _startingZero = false;
      } else if (clr && _pressedtxt != "0") {
        _txt = _pressedtxt;
        _previoustxt = _pressedtxt;
        clr = false;
      } else if (_pressedtxt == "+" ||
          _pressedtxt == "-" ||
          _pressedtxt == "%" ||
          _pressedtxt == "." ||
          _pressedtxt == "÷" ||
          _pressedtxt == "×") {
        if (_pressedtxt == _previoustxt) {
          _txt = _txt;
          _previoustxt = _pressedtxt;
        } else {
          if (_previoustxt == "+" ||
              _previoustxt == "-" ||
              _previoustxt == "%" ||
              _previoustxt == "×" ||
              _previoustxt == "." ||
              _previoustxt == "÷") {
            _txt = _txt.substring(0, _txt.length - 1) + _pressedtxt;
          } else {
            _txt = _txt + _pressedtxt;
          }
          _previoustxt = _pressedtxt;
        }
      } else {
        _txt = _txt + _pressedtxt;
        _previoustxt = _pressedtxt;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('calculator'),
          ),
          body: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                ),
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          child: Text(_txt,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20))),
                      SizedBox(height: 50),
                      Container(
                        height: 40,
                        child: Text(_updatedExpression,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(6),
                              child: RaisedButton(
                                padding: EdgeInsets.all(5),
                                color: Colors.black,
                                onPressed: () => updateResults("AC"),
                                child: Text(
                                  "AC",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              )),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(6),
                              child: RaisedButton(
                                padding: EdgeInsets.all(5),
                                color: Colors.black,
                                onPressed: () => updateResults('⌫'),
                                child: Text(
                                  '⌫',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              )),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(6),
                              child: RaisedButton(
                                padding: EdgeInsets.all(5),
                                color: Colors.black,
                                onPressed: () => updateResults("%"),
                                child: Text(
                                  '%',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              )),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(6),
                              child: RaisedButton(
                                padding: EdgeInsets.all(5),
                                color: Colors.black,
                                onPressed: () => updateResults("÷"),
                                child: Text(
                                  '÷',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              )),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(6),
                              child: RaisedButton(
                                padding: EdgeInsets.all(5),
                                color: Colors.black,
                                onPressed: () => updateResults("7"),
                                child: Text(
                                  "7",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              )),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(6),
                              child: RaisedButton(
                                padding: EdgeInsets.all(5),
                                color: Colors.black,
                                onPressed: () => updateResults("8"),
                                child: Text(
                                  '8',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              )),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(6),
                              child: RaisedButton(
                                padding: EdgeInsets.all(5),
                                color: Colors.black,
                                onPressed: () => updateResults("9"),
                                child: Text(
                                  '9',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              )),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(6),
                              child: RaisedButton(
                                padding: EdgeInsets.all(5),
                                color: Colors.black,
                                onPressed: () => updateResults("×"),
                                child: Text(
                                  '×',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              )),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(6),
                              child: RaisedButton(
                                padding: EdgeInsets.all(5),
                                color: Colors.black,
                                onPressed: () => updateResults("4"),
                                child: Text(
                                  "4",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              )),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(6),
                              child: RaisedButton(
                                padding: EdgeInsets.all(5),
                                color: Colors.black,
                                onPressed: () => updateResults("5"),
                                child: Text(
                                  '5',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              )),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(6),
                              child: RaisedButton(
                                padding: EdgeInsets.all(5),
                                color: Colors.black,
                                onPressed: () => updateResults("6"),
                                child: Text(
                                  '6',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              )),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(6),
                              child: RaisedButton(
                                padding: EdgeInsets.all(5),
                                color: Colors.black,
                                onPressed: () => updateResults("-"),
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              )),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(6),
                              child: RaisedButton(
                                padding: EdgeInsets.all(5),
                                color: Colors.black,
                                onPressed: () => updateResults("1"),
                                child: Text(
                                  "1",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              )),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(6),
                              child: RaisedButton(
                                padding: EdgeInsets.all(5),
                                color: Colors.black,
                                onPressed: () => updateResults("2"),
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              )),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(6),
                              child: RaisedButton(
                                padding: EdgeInsets.all(5),
                                color: Colors.black,
                                onPressed: () => updateResults("3"),
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              )),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(6),
                              child: RaisedButton(
                                padding: EdgeInsets.all(5),
                                color: Colors.black,
                                onPressed: () => updateResults("+"),
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              )),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(6),
                              child: RaisedButton(
                                padding: EdgeInsets.all(5),
                                color: Colors.black,
                                onPressed: () => updateResults("0"),
                                child: Text(
                                  '0',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              )),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(6),
                              child: RaisedButton(
                                padding: EdgeInsets.all(5),
                                color: Colors.black,
                                onPressed: () => updateResults("."),
                                child: Text(
                                  '.',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              )),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(6),
                              child: RaisedButton(
                                padding: EdgeInsets.all(5),
                                color: Colors.black,
                                onPressed: () => updateResults("="),
                                child: Text(
                                  '=',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
