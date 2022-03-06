import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    return (resultScore <= 8)
        ? 'Pretty Awesome!!!\nScore = '
        : (resultScore <= 12)
            ? 'Pretty Cool!\nScore = '
            : (resultScore <= 16)
                ? 'Pretty Strange!\nScore = '
                : 'Pretty Awkward!\nScore = ';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase + resultScore.toString() + '\n\u{1F339}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
              onPressed: () {
                resetQuiz();
              },
              child: const Text('Restart Quiz'),
          style: TextButton.styleFrom(
              primary: Colors.yellow,
              backgroundColor: Colors.black
          ),)
        ],
      ),
    );
  }
}
