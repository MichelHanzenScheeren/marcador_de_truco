import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color backGroundColor;
  final Color borderColor;
  final String buttonText;
  final Color textColor;
  final Function onPressed;
  final double heigth;
  final double width;
  CustomButton({
    this.backGroundColor: Colors.transparent,
    this.borderColor: Colors.transparent,
    this.buttonText: "",
    this.textColor: Colors.black,
    this.onPressed,
    this.heigth: 50,
    this.width: double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heigth,
      width: width,
      child: RaisedButton(
        elevation: 1,
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
