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
    return Column(
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
          ); //usamos una función anónima que flutter no la ejecutará cuando esté haciendo el build(). En el cuerpo de esta función anónima, llamamos a la función que queremos que se ejecute onPressed
        }).toList(),

        // (33)
        // para cualquier lista (array), podemos usar el método map()
        // el método map ejecutará una función (que tenemos que mandarle como argumento) para cada elemento en la lista.
        // en este caso estamos iterando la lista valores de 'answer'
        // .toList() -> para transformar un grupo de objetos en una lista
        // ... -> para 'desagregar' los objetos de una lista, o sea para quitarlos de la lista y dejarlos en su padre
        // "as List<String>" -> lo tenemos que poner porque Dart no puede saber que ese objeto es una lista. Le tenemos que decir específicamente que interprete eso como una lista de strings.
      ],
    );
  }
}
