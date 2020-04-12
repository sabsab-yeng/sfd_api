import 'package:flutter/material.dart';

class FlatButtonWidget extends StatelessWidget {
  final Color color;
  final String title;
  final VoidCallback onPressed;

  FlatButtonWidget({this.title, this.color, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: color,
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
