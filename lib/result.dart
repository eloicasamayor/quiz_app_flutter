import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    //para definir getter:
    // tipo de valor quieres conseguir + !get" + nombreResultado + {}
    // un getter es como un método pero nunca puede recibir ningún argumento.
    // devuelve un valor (return) calculado dinámicamente.

    var resultText = 'You did it';
    if (resultScore <= 8) {
      resultText = "You are awesome and innocent!";
    } else if (resultScore <= 12) {
      resultText = "You are likeable!";
    } else if (resultScore <= 16) {
      resultText = "You are strange...!";
    } else {
      resultText = "You are bad!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        FlatButton(onPressed: resetHandler, child: Text('Restart Quiz'))
      ]),
    );
  }
}
