import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:auto_size_text/auto_size_text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MaterialCalculator(),
    );
  }
}

class MaterialCalculator extends StatefulWidget {
  @override
  _MaterialCalculatorState createState() => _MaterialCalculatorState();
}

class _MaterialCalculatorState extends State<MaterialCalculator> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationfont = 38.0;
  double resultfont = 48.0;

  PatternVibrate() {
    HapticFeedback.mediumImpact();
  }

  //functionality
  buttonpressed(String buttonValue) {
    setState(() {
      HapticFeedback.mediumImpact();
      if (buttonValue == "C") {
        equationfont = 38;
        resultfont = 48;
        equation = "0";
        result = "0";
      } else if (buttonValue == "⌫") {
        equation = equation.substring(0, equation.length - 1);
        equationfont = 48;
        resultfont = 38;
        if (equation == "") {
          equation = "0";
          result = "0";
          equationfont = 38;
          resultfont = 48;
        }
      } else if (buttonValue == "=") {
        equationfont = 38;
        resultfont = 48;

        expression = equation;
        expression = expression.replaceAll("x", "*");
        expression = expression.replaceAll("÷", "/");

        try {
          Parser parser = new Parser();
          Expression exp = parser.parse(expression);

          ContextModel contextModel = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, contextModel)}';
        } catch (e) {
          result = "ERROR";
        }
      } else if (equation == "0") {
        equationfont = 48;
        resultfont = 38;
        equation = buttonValue;
      } else {
        equationfont = 48;
        resultfont = 38;
        equation = equation + buttonValue;
      }
    });
  }

  Widget CalButtons(String ButtonValue, Color Buttoncolor, Color fontcolor,
      double Buttonheight, double ButtonWeights) {
    return Container(
      margin: EdgeInsets.all(7),
      height: MediaQuery.of(context).size.height * 0.1 * Buttonheight,
      width: MediaQuery.of(context).size.width * ButtonWeights,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFF1D262E)),
        color: Buttoncolor,
        boxShadow: [
          BoxShadow(
              color: Color(0x93000000), blurRadius: 5, offset: Offset(-5, 5)),
        ],
      ),
      child: MaterialButton(
        splashColor: Colors.transparent,
        padding: EdgeInsets.all(16),
        onPressed: () {
          buttonpressed(ButtonValue);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          ButtonValue,
          style: TextStyle(
              fontSize: 30, color: fontcolor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget EqualButton(String ButtonValue, Color Buttoncolor, double Buttonheight,
      double Buttonwidth) {
    return Container(
      margin: EdgeInsets.all(7),
      height: MediaQuery.of(context).size.height * 0.1 * Buttonheight,
      width: MediaQuery.of(context).size.width * Buttonwidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFF1D262E)),
        color: Buttoncolor,
        boxShadow: [
          BoxShadow(
              color: Color(0x93000000), blurRadius: 5, offset: Offset(-5, 5)),
        ],
      ),
      child: MaterialButton(
        splashColor: Colors.transparent,
        padding: EdgeInsets.all(16),
        onPressed: () {
          buttonpressed(ButtonValue);
        },
        child: Text(
          ButtonValue,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget dividebutton(String ButtonValue, Color Buttoncolor, Color fontcolor,
      double Buttonheight) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      height: MediaQuery.of(context).size.height * 0.1 * Buttonheight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        border: Border.all(color: Color(0xFF1D262E)),
        color: Buttoncolor,
        boxShadow: [
          BoxShadow(
              color: Color(0x93000000), blurRadius: 5, offset: Offset(-5, 5)),
        ],
      ),
      child: MaterialButton(
        splashColor: Colors.transparent,
        padding: EdgeInsets.all(16),
        onPressed: () => buttonpressed(ButtonValue),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          ButtonValue,
          style: TextStyle(
              fontSize: 50, color: fontcolor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget Multiplybutton(String ButtonValue, Color Buttoncolor, Color fontcolor,
      double Buttonheight) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      height: MediaQuery.of(context).size.height * 0.1 * Buttonheight,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF1D262E)),
        color: Buttoncolor,
        boxShadow: [
          BoxShadow(
              color: Color(0x93000000), blurRadius: 5, offset: Offset(-5, 5)),
        ],
      ),
      child: MaterialButton(
        splashColor: Colors.transparent,
        padding: EdgeInsets.all(16),
        onPressed: () => buttonpressed(ButtonValue),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          ButtonValue,
          style: TextStyle(
              fontSize: 50, color: fontcolor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget Addbutton(String ButtonValue, Color Buttoncolor, Color fontcolor,
      double Buttonheight) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      height: MediaQuery.of(context).size.height * 0.1 * Buttonheight,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF1D262E)),
        color: Buttoncolor,
        boxShadow: [
          BoxShadow(
              color: Color(0x93000000), blurRadius: 5, offset: Offset(-5, 5)),
        ],
      ),
      child: MaterialButton(
        splashColor: Colors.transparent,
        padding: EdgeInsets.all(16),
        onPressed: () => buttonpressed(ButtonValue),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          ButtonValue,
          style: TextStyle(
              fontSize: 50, color: fontcolor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget subtractbutton(String ButtonValue, Color Buttoncolor, Color fontcolor,
      double Buttonheight) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      height: MediaQuery.of(context).size.height * 0.1 * Buttonheight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        border: Border.all(color: Color(0xFF1D262E)),
        color: Buttoncolor,
        boxShadow: [
          BoxShadow(
              color: Color(0x93000000), blurRadius: 5, offset: Offset(-5, 5)),
        ],
      ),
      child: MaterialButton(
        splashColor: Colors.transparent,
        padding: EdgeInsets.all(16),
        onPressed: () => buttonpressed(ButtonValue),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          ButtonValue,
          style: TextStyle(
              fontSize: 50, color: fontcolor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF243441),
      appBar: AppBar(
        backgroundColor: Color(0xFF243441),
        title: Center(child: Text("Calculator")),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xFF1D262E)),
                color: Color(0xFF243441),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x93000000),
                      blurRadius: 5,
                      offset: Offset(0, 5)),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.fromLTRB(10, 5, 5, 20),
                      child: AutoSizeText(
                        equation,
                        maxLines: 4,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: equationfont, color: Colors.white),
                      ),
                    ),
                  ),
//                  TextField(
//                    readOnly: true,
//                    showCursor: false,
//                    textAlign: TextAlign.right,
//                    style: TextStyle(fontSize: equationfont,color: Colors.white),
//                    cursorColor: Colors.white,
//                    decoration: new InputDecoration(
//
//                      border: InputBorder.none,
//                      focusedBorder: InputBorder.none,
//                      enabledBorder: InputBorder.none,
//                      errorBorder: InputBorder.none,
//                      disabledBorder: InputBorder.none,
//                      hintText: equation,
//                      hintStyle: TextStyle(fontSize: equationfont,color: Colors.white),
//                      contentPadding: EdgeInsets.fromLTRB(10, 5, 5, 20),
//                    ),
//                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.fromLTRB(10, 5, 5, 20),
                      child: AutoSizeText(
                        result,
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: resultfont, color: Colors.white),
                      )
//                    Text(
//                      result,
//                      style:
//                          TextStyle(fontSize: resultfont, color: Colors.white),
//                    ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * .75,
                    child: Table(
                      children: [
                        TableRow(children: [
                          CalButtons(
                              "C", Color(0xFF243441), Color(0xFFC73D00), 1, 0),
                          CalButtons(
                              "⌫", Color(0xFF243441), Color(0xFFC73D00), 1, 0),
                          CalButtons(
                              "%", Color(0xFF243441), Color(0xFFC73D00), 1, 0),
                        ]),
                        TableRow(children: [
                          CalButtons(
                              "1", Color(0xFF243441), Colors.white, 1, 0),
                          CalButtons(
                              "2", Color(0xFF243441), Colors.white, 1, 0),
                          CalButtons(
                              "3", Color(0xFF243441), Colors.white, 1, 0),
                        ]),
                        TableRow(children: [
                          CalButtons(
                              "4", Color(0xFF243441), Colors.white, 1, 0),
                          CalButtons(
                              "5", Color(0xFF243441), Colors.white, 1, 0),
                          CalButtons(
                              "6", Color(0xFF243441), Colors.white, 1, 0),
                        ]),
                        TableRow(children: [
                          CalButtons(
                              "7", Color(0xFF243441), Colors.white, 1, 0),
                          CalButtons(
                              "8", Color(0xFF243441), Colors.white, 1, 0),
                          CalButtons(
                              "9", Color(0xFF243441), Colors.white, 1, 0),
                        ]),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .25,
                    child: Table(
                      children: [
                        TableRow(children: [
                          dividebutton(
                              "÷", Color(0xFFC73D00), Colors.white, 1.13),
                        ]),
                        TableRow(children: [
                          Multiplybutton(
                              "x", Color(0xFFC73D00), Colors.white, 1.13),
                        ]),
                        TableRow(children: [
                          Addbutton("+", Color(0xFFC73D00), Colors.white, 1.13),
                        ]),
                        TableRow(children: [
                          subtractbutton(
                              "-", Color(0xFFC73D00), Colors.white, 1.13),
                        ]),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * .50,
                    child: Table(
                      children: [
                        TableRow(children: [
                          CalButtons(
                              "0", Color(0xFF243441), Colors.white, 1, 0),
                          CalButtons(
                              ".", Color(0xFF243441), Colors.white, 1, 0),
                        ])
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .50,
                    child: Table(
                      children: [
                        TableRow(children: [
                            EqualButton("=", Color(0xFF009067), 1, 0),
                        ])
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

