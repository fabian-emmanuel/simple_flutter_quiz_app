import 'package:flutter/material.dart';
import 'package:test_app/quiz.dart';
import 'package:test_app/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  State createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is Your Favourite Color?',
      'answerTexts': [
        {'item': 'Green', 'score': 7},
        {'item': 'Blue', 'score': 6},
        {'item': 'Yellow', 'score': 5},
        {'item': 'Orange', 'score': 4},
        {'item': 'Black', 'score': 3}
      ]
    },
    {
      'questionText': 'What is Your Favourite animal?',
      'answerTexts': [
        {'item': 'Cat', 'score': 5},
        {'item': 'Dog', 'score': 7},
        {'item': 'Elephant', 'score': 6}
      ]
    },
    {
      'questionText': 'What is Your Favourite City?',
      'answerTexts': [
        {'item': 'Paris', 'score': 2},
        {'item': 'Oxford', 'score': 3},
        {'item': 'Norway', 'score': 4},
        {'item': 'California', 'score': 5}
      ]
    }
  ];

  var _index = 0;
  var _totalScore = 0;

  void _answer(int score) {
    _totalScore += score;
    setState(() {
      _index = _index + 1;
    });
  }

  void _resetQuiz(){
    setState(() {
      _index = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Favourite Quiz App'),
          ),
          body: (_index < _questions.length)
              ? Quiz(questions: _questions, index: _index, answer: _answer)
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
