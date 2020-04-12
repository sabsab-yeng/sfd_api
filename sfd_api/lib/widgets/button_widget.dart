import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Function onPressed;

  ButtonWidget({this.onPressed, this.title});
  
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        title,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        if(onPressed != null){
          onPressed();
        }
      },
    );
  }
}
