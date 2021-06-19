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
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
              Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
            ],
            end: Alignment.topLeft,
            begin: Alignment.bottomRight,
            stops: [0, 1],
          ),
        ),
      ),
      Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(),
            ),
            Text(
              resultPhrase,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Container(),
            ),
            TextButton(
              onPressed: resetHandler,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white30),
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20)),
                padding: MaterialStateProperty.all(EdgeInsets.all(35)),
              ),
              child: Text(
                'Restart Quiz',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(),
            ),
          ]),
    ]);
  }
}
