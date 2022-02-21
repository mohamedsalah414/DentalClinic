import 'package:flutter/material.dart';

import 'text_utils.dart';

class Button extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color color;
  const Button({Key? key, required this.text, required this.onPressed, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: TextUtils(
        text: text,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      style: ElevatedButton.styleFrom(
        primary: color,
        minimumSize: Size(360, 50),
      ),
    );
  }
}
