import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Widgets/calcbutton.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const CalcApp());
}

class CalcApp extends StatefulWidget {
  const CalcApp({Key? key}) : super(key: key);

  @override
  State<CalcApp> createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  // This widget is the root of your application.
  String _history = '';
  String _expression = '';
  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: Color(0xff283637),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 12),
              child: Text(
                _history,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                    fontSize: 24,
                  ),
                  color: Color(0xff545f61),
                ),
              ),
              alignment: Alignment(1, 1),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Text(
                _expression,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                    fontSize: 48,
                  ),
                  color: Colors.white,
                ),
              ),
              alignment: Alignment(1, 1),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: 'AC',
                    textColor: 0xff6c807f,
                    fillColor: 0xffffffff,
                    textSize: 26,
                    callBack: allClear,
                  ),
                  CalcButton(
                    text: 'C',
                    textColor: 0xff6c807f,
                    fillColor: 0xffffffff,
                    callBack: clear,
                  ),
                  CalcButton(
                    text: '%',
                    textColor: 0xffffffff,
                    fillColor: 0xff65bdac,
                    callBack: numClick,
                  ),
                  CalcButton(
                    text: '/',
                    textColor: 0xffffffff,
                    fillColor: 0xff65bdac,
                    callBack: numClick,
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '7',
                    textColor: 0xff283637,
                    fillColor: 0xffffffff,
                    callBack: numClick,
                  ),
                  CalcButton(
                    text: '8',
                    textColor: 0xff283637,
                    fillColor: 0xffffffff,
                    callBack: numClick,
                  ),
                  CalcButton(
                    text: '9',
                    textColor: 0xff283637,
                    fillColor: 0xffffffff,
                    callBack: numClick,
                  ),
                  CalcButton(
                    text: '*',
                    textColor: 0xffffffff,
                    fillColor: 0xff65bdac,
                    callBack: numClick,
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '4',
                    textColor: 0xff283637,
                    fillColor: 0xffffffff,
                    callBack: numClick,
                  ),
                  CalcButton(
                    text: '5',
                    textColor: 0xff283637,
                    fillColor: 0xffffffff,
                    callBack: numClick,
                  ),
                  CalcButton(
                    text: '6',
                    textColor: 0xff283637,
                    fillColor: 0xffffffff,
                    callBack: numClick,
                  ),
                  CalcButton(
                    text: '-',
                    textColor: 0xffffffff,
                    fillColor: 0xff65bdac,
                    callBack: numClick,
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '1',
                    textColor: 0xff283637,
                    fillColor: 0xffffffff,
                    callBack: numClick,
                  ),
                  CalcButton(
                    text: '2',
                    textColor: 0xff283637,
                    fillColor: 0xffffffff,
                    callBack: numClick,
                  ),
                  CalcButton(
                    text: '3',
                    textColor: 0xff283637,
                    fillColor: 0xffffffff,
                    callBack: numClick,
                  ),
                  CalcButton(
                    text: '+',
                    textColor: 0xffffffff,
                    fillColor: 0xff65bdac,
                    callBack: numClick,
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '.',
                    textColor: 0xff283637,
                    fillColor: 0xffffffff,
                    callBack: numClick,
                  ),
                  CalcButton(
                    text: '0',
                    textColor: 0xff283637,
                    fillColor: 0xffffffff,
                    callBack: numClick,
                  ),
                  CalcButton(
                    text: '00',
                    textColor: 0xff283637,
                    fillColor: 0xffffffff,
                    callBack: numClick,
                  ),
                  CalcButton(
                    text: '=',
                    textColor: 0xffffffff,
                    fillColor: 0xff65bdac,
                    callBack: evaluate,
                  ),
                ]),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
