import 'package:calculator/calc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double width = 0.0;
  String str = "";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        str = "0";
        result = "0";
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      } else if (buttonText == "⌫") {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        str = str.substring(0, str.length - 1);
        if (str == "") {
          str = "0";
        }
      } else {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        if (str == "0") {
          str = buttonText;
        } else {
          str = str + buttonText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width / 4;
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  str,
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
            )),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  result,
                  style: TextStyle(
                    fontSize: resultFontSize,
                  ),
                ),
              ),
            )),
            Row(
              children: [
                SizedBox(
                  width: width,
                  height: width,
                  child: Container(
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                        onPressed: () {
                          setState(() {
                            str = "";
                            result = "0";
                          });
                        },
                        child: Text(
                          'C',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )),
                    color: Colors.orangeAccent,
                  ),
                ),
                SizedBox(
                  width: width,
                  height: width,
                  child: Container(
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                        onPressed: () {
                          setState(() {
                            str += "÷";
                          });
                        },
                        child: Icon(
                          CupertinoIcons.divide,
                          color: Colors.white,
                        )),
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  width: width,
                  height: width,
                  child: Container(
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                        onPressed: () {
                          setState(() {
                            str += "×";
                          });
                        },
                        child: Icon(
                          CupertinoIcons.multiply,
                          color: Colors.white,
                        )),
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  width: width,
                  height: width,
                  child: Container(
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                        onPressed: () {
                          setState(() {
                            if (str.length > 0) {
                              str = str.substring(0, str.length - 1);
                            }
                          });
                        },
                        child: Icon(
                          CupertinoIcons.delete_left,
                          color: Colors.white,
                        )),
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: width,
                  height: width,
                  child: Container(
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                        onPressed: () {
                          setState(() {
                            str += "7";
                          });
                        },
                        child: Text(
                          '7',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )),
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: width,
                  height: width,
                  child: Container(
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                        onPressed: () {
                          setState(() {
                            str += "8";
                          });
                        },
                        child: Text(
                          '8',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )),
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: width,
                  height: width,
                  child: Container(
                    color: Colors.grey,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                        onPressed: () {
                          setState(() {
                            str += "9";
                          });
                        },
                        child: Text(
                          '9',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )),
                  ),
                ),
                SizedBox(
                  width: width,
                  height: width,
                  child: Container(
                    color: Colors.blue,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                        onPressed: () {
                          setState(() {
                            str += "+";
                          });
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: width,
                  height: width,
                  child: Container(
                    color: Colors.grey,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                        onPressed: () {
                          setState(() {
                            str += "4";
                          });
                        },
                        child: Text(
                          '4',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )),
                  ),
                ),
                SizedBox(
                    width: width,
                    height: width,
                    child: Container(
                      color: Colors.grey,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                        onPressed: () {
                          setState(() {
                            str += "5";
                          });
                        },
                        child: Text(
                          '5',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    )),
                SizedBox(
                    width: width,
                    height: width,
                    child: Container(
                      color: Colors.grey,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(
                            color: Colors.white,
                            width: 1,
                          )),
                          onPressed: () {
                            setState(() {
                              str += "6";
                            });
                          },
                          child: Text(
                            '6',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          )),
                    )),
                SizedBox(
                  width: width,
                  height: width,
                  child: Container(
                    color: Colors.blue,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                        onPressed: () {
                          setState(() {
                            str += "-";
                          });
                        },
                        child: Icon(
                          CupertinoIcons.minus,
                          color: Colors.white,
                        )),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: width,
                          height: width,
                          child: Container(
                            color: Colors.grey,
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                )),
                                onPressed: () {
                                  setState(() {
                                    str += "1";
                                  });
                                },
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                )),
                          ),
                        ),
                        SizedBox(
                            width: width,
                            height: width,
                            child: Container(
                              color: Colors.grey,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                )),
                                onPressed: () {
                                  setState(() {
                                    str += "2";
                                  });
                                },
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                              ),
                            )),
                        SizedBox(
                            width: width,
                            height: width,
                            child: Container(
                              color: Colors.grey,
                              child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                    color: Colors.white,
                                    width: 1,
                                  )),
                                  onPressed: () {
                                    setState(() {
                                      str += "3";
                                    });
                                  },
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  )),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 2,
                          height: width,
                          child: Container(
                            color: Colors.grey,
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                )),
                                onPressed: () {
                                  setState(() {
                                    str += "0";
                                  });
                                },
                                child: Text(
                                  '0',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                )),
                          ),
                        ),
                        SizedBox(
                          width: width,
                          height: width,
                          child: Container(
                            color: Colors.grey,
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                )),
                                onPressed: () {
                                  setState(() {
                                    str += ".";
                                  });
                                },
                                child: Text(
                                  '.',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: width,
                  height: width * 2,
                  child: Container(
                    color: Colors.blue,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )),
                        onPressed: () {
                          setState(() {
                            equationFontSize = 38.0;
                            resultFontSize = 48.0;

                            expression = str;
                            expression = expression.replaceAll('×', '*');
                            expression = expression.replaceAll('÷', '/');
                            try {
                              Parser p = Parser();
                              Expression exp = p.parse(expression);

                              ContextModel cm = ContextModel();
                              result =
                                  '${exp.evaluate(EvaluationType.REAL, cm)}';
                            } catch (e) {
                              result = "Error";
                            }
                          });
                        },
                        child: Icon(
                          CupertinoIcons.equal,
                          color: Colors.white,
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
