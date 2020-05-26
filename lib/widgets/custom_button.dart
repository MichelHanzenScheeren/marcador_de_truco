import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color backGroundColor;
  final Color borderColor;
  final String buttonText;
  final Color textColor;
  final Function onPressed;
  CustomButton({
    this.backGroundColor: Colors.white,
    this.borderColor: Colors.transparent,
    this.buttonText: "",
    this.textColor: Colors.black,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: RaisedButton(
        elevation: 0,
        color: backGroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: borderColor),
        ),
        child: Text(buttonText, style: TextStyle(color: textColor)),
        onPressed: onPressed,
      ),
    );
  }
}
