import 'package:calculator_application/button_model.dart';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String displayNum = '';
  String answer = '';
  List<String> history = [];
  String display(String buttonName) {
    setState(() {
      if (buttonName == 'C') {
        displayNum = '';
        answer = '';
        return;
      } else if (buttonName == '=') {
        answer = calculate(displayNum);
        history.add('$displayNum = $answer');
        print(history);
      } else {
        displayNum += buttonName;
      }
    });

    return displayNum;
  }

  String calculate(String input) {
    try {
      Parser p = Parser();
      Expression exp = p.parse(input.replaceAll('x', '*'));

      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      return eval.toString();
    } catch (e) {
      return 'error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // TextFormField(
            //   controller: calculatorText,
            //   keyboardType: TextInputType.none,
            //   enabled: true,
            //   decoration: const InputDecoration(
            //       enabledBorder: UnderlineInputBorder(
            //           borderSide: BorderSide.none,
            //           borderRadius: BorderRadius.zero)),
            // ),
            Text(
              displayNum,
              style: const TextStyle(color: Colors.white, fontSize: 40),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              answer,
              style: const TextStyle(color: Colors.white, fontSize: 40),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonModel(
                      buttonName: 'C',
                      function: () {
                        display('C');
                      },
                      colors: Colors.grey.shade50,
                    ),
                    ButtonModel(
                      buttonName: '+/-',
                      function: () {},
                      colors: Colors.grey.shade50,
                    ),
                    ButtonModel(
                      buttonName: '%',
                      function: () {
                        display('%');
                      },
                      colors: Colors.grey.shade50,
                    ),
                    ButtonModel(
                      buttonName: '+',
                      function: () {
                        display('+');
                      },
                      colors: Colors.amber,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonModel(
                      buttonName: '7',
                      function: () {
                        display('7');
                      },
                      colors: Colors.grey.shade800,
                    ),
                    ButtonModel(
                      buttonName: '8',
                      function: () {
                        display('8');
                      },
                      colors: Colors.grey.shade800,
                    ),
                    ButtonModel(
                      buttonName: '9',
                      function: () {
                        display('9');
                      },
                      colors: Colors.grey.shade800,
                    ),
                    ButtonModel(
                      buttonName: 'x',
                      function: () {
                        display('x');
                      },
                      colors: Colors.amber,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonModel(
                      buttonName: '4',
                      function: () {
                        display('4');
                      },
                      colors: Colors.grey.shade800,
                    ),
                    ButtonModel(
                      buttonName: '5',
                      function: () {
                        display('5');
                      },
                      colors: Colors.grey.shade800,
                    ),
                    ButtonModel(
                      buttonName: '6',
                      function: () {
                        display('6');
                      },
                      colors: Colors.grey.shade800,
                    ),
                    ButtonModel(
                      buttonName: '-',
                      function: () {
                        display('-');
                      },
                      colors: Colors.amber,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonModel(
                      buttonName: '1',
                      function: () {
                        display('1');
                      },
                      colors: Colors.grey.shade800,
                    ),
                    ButtonModel(
                      buttonName: '2',
                      function: () {
                        display('2');
                      },
                      colors: Colors.grey.shade800,
                    ),
                    ButtonModel(
                      buttonName: '3',
                      function: () {
                        display('3');
                      },
                      colors: Colors.grey.shade800,
                    ),
                    ButtonModel(
                      buttonName: '+',
                      function: () {
                        display('+');
                      },
                      colors: Colors.amber,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: GestureDetector(
                        onTap: () {
                          display('0');
                        },
                        child: Container(
                          width: 140,
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey.shade800,
                          ),
                          child: const Center(
                            child: Text(
                              '0',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ButtonModel(
                      buttonName: '.',
                      function: () {
                        display('.');
                      },
                      colors: Colors.grey.shade800,
                    ),
                    ButtonModel(
                      buttonName: '=',
                      function: () {
                        display('=');
                      },
                      colors: Colors.grey.shade800,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
