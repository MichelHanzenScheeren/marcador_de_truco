import 'package:flutter/material.dart';

class TitleDivider extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color dividerColor;
  TitleDivider({
    this.text: "",
    this.dividerColor: Colors.black,
    this.textColor: Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: Divider(color: dividerColor)),
        SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(color: textColor),
        ),
        SizedBox(width: 5),
        Expanded(child: Divider(color: dividerColor)),
      ],
    );
  }
}
