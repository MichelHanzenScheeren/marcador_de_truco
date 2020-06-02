import 'package:flutter/material.dart';

class CustomSnackbar extends SnackBar {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final int secondsDuration;
  CustomSnackbar({
    @required this.text,
    this.textColor,
    this.backgroundColor,
    this.secondsDuration: 3,
  }) : super(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 1),
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          backgroundColor: backgroundColor ?? Colors.red,
          duration: Duration(seconds: secondsDuration),
        );
}
