import 'package:flutter/material.dart';

import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {

  final List<Map<String, Object>> questions;
  final int index;
  final Function answer;

  Quiz({required this.questions, required this.answer, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[index]['questionText'].toString()),
        ...(questions[index]['answerTexts'] as List<Map<String, Object>>).map((result) {
          return Answer(() => answer(result['score']), result['item'].toString());
        })
      ],
    );
  }
}
