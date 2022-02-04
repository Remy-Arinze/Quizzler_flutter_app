import 'dart:ffi';

import 'package:flutter/material.dart';
import 'questions.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatefulWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  _QuizzlerState createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  List<Question> questions = [
    Question('Lagos is the capital city of nigeria', false),
    Question('I am six feet tall', false),
    Question('i\'m in love with a girl ', true),
    Question('Her name is favour', true)
  ];

  int number = 0;
  List<Icon> score = [];

  void addScore(bool check) {
    print(check);
    if (check == true) {
      score.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
    } else {
      score.add(Icon(
        Icons.cancel,
        color: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Quizzler',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 1,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 10,
              child: Center(
                child: Text(
                  questions[number].q,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  EdgeInsets.only(left: 100, right: 100)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green)),
                      onPressed: () {
                        bool answer = questions[number].a;
                        if (answer == true) {
                          addScore(true);
                        } else {
                          addScore(false);
                        }

                        setState(() {
                          if (number < questions.length) {
                            number++;
                          }
                        });
                      },
                      child: Text('True')),
                  ElevatedButton(
                      style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  EdgeInsets.only(left: 100, right: 100)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red)),
                      onPressed: () {
                        bool falseAnswer = questions[number].a;
                        if (falseAnswer == false) {
                          addScore(true);
                        } else {
                          addScore(false);
                        }

                        setState(() {
                          if (number < questions.length) {
                            number++;
                          }
                        });
                      },
                      child: Text(
                        'False',
                        style: TextStyle(),
                      )),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: score,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
