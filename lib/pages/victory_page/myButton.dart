import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Size size;
  final Color backColor;
  final Color borderColor;
  final Function() function;

  MyButton(
      {this.text: "",
      @required this.size,
      this.borderColor: Colors.black,
      this.backColor: Colors.white,
      this.function});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: size.width - 40,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor, width: 2),
          color: backColor,
        ),
        child: Text(text),
      ),
      onTap: function,
    );
  }
}
