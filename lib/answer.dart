import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler; //una variable de tipo "pointer" a una función
  final String answerText;
  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 50,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white30),
          padding: MaterialStateProperty.all(EdgeInsets.all(20)),
          elevation: MaterialStateProperty.all(0),
        ),
        child: Text(
          answerText,
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        onPressed: selectHandler,
      ),
    );
  }
}
