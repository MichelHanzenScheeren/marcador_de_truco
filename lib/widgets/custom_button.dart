import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color backGroundColor;
  final String buttonText;
  final Color textColor;
  final Function onPressed;
  CustomButton({
    this.backGroundColor: Colors.white,
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
        ),
        child: Text(buttonText, style: TextStyle(color: Colors.white)),
        onPressed: onPressed,
      ),
    );
  }
}
