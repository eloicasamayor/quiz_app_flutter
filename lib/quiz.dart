import 'package:flutter/material.dart';

import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions; //Nested generic assignments
  final Function answerQuestion; // pointer to a function
  final int questionIndex;

  Quiz({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
                Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0, 1],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //(27) -> nuevo custom widget.
            Question(questions[questionIndex]['questionText']),
            // para acceder al elemento de una lista, podemos usar nombreLista[indice] o bien nombreLista.elementAt(indice)
            ...(questions[questionIndex]['answer'] as List<Map<String, Object>>)
                .map((answer) {
              return Answer(
                () => answerQuestion(answer['score']),
                answer['text'],
              );
            }).toList(),
          ],
        )
      ],
    );
  }
}
