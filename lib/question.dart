import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  //es un widget Stateless pero aun así, cuando cambia el valor del input, se re-renderiza.
  final String
      questionText; //si añadimos "final" en la declaracion de la variable, estamos diciendo que no cambiará el valor después de la definición en el constructor. Cuando una variable es final, no podemos reasignarle un nuevo valor después de que fue asignada por el constructor.

  Question(
      this.questionText); // este es el constructor. El constructor se llama cuando el objeto es creado.
  //forma corta: nos ahorramos las llaves y el constructor simplemente almacenará el primer argumento en la variable questionText.

  //(30)
  //[Ctrl + click] sobre una clase -> para ir a donde se define esta clase.
  //Flutter.dev -> Dodumentación Oficial.
  @override
  Widget build(BuildContext context) {
    return Container(
      // como otros widgets visibles, el Container consta del child (body), padding, border y margin.
      width: double.infinity, //significa que ocupará de ancho lo mas que pueda.
      margin: EdgeInsets.all(10),
      //la clase EdgeInsets tiene diferentes constructores, para crear EdgeInsets con diferentes configuraciones.
      child: Text(
        // Por defecto, el widget Text ocupa solamente lo necesario. Para poder centrarlo necesitamos meterlo dentro de un container.
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
