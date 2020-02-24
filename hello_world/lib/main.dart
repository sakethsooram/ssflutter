import 'package:flutter/material.dart';
import './question.dart';
import './answers.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });
    print("Question Index is: $_questionIndex");
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': "Whats your fav color?",
        'answers': ['Red', 'Green', 'Blue']
      },
      {
        'questionText': "Whats your fav animal?",
        'answers': ['Lion', 'Dog', 'Birds']
      },
      {
        'questionText': "Whats your fav cuisine?",
        'answers': ['Continental', 'Mexican', 'Indian']
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello World'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
