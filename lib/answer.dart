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
        style: ElevatedButton.styleFrom(
          onSurface: Colors.blue,
          padding: EdgeInsets.all(30),
        ),
        child: Text(
          answerText,
          style: TextStyle(fontSize: 18),
        ),
        onPressed: selectHandler,
      ),
    );
  }
}
