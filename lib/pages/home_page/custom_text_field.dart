import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final String playerNumber;
  final Function(String valur) changed;
  CustomTextField({
    @required this.text,
    @required this.playerNumber,
    @required this.changed,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 5),
        child: TextFormField(
          initialValue: text,
          textAlign: TextAlign.center,
          onChanged: changed,
          decoration: InputDecoration(
            labelText: "Player $playerNumber",
          ),
        ),
      ),
    );
  }
}
