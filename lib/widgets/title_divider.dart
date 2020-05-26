import 'package:flutter/material.dart';

class TitleDivider extends StatelessWidget {
  final String text;
  final Color dividerColor;
  TitleDivider({this.text: "", this.dividerColor: Colors.black});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: Divider(color: dividerColor)),
        SizedBox(width: 5),
        Text(text),
        SizedBox(width: 5),
        Expanded(child: Divider(color: dividerColor)),
      ],
    );
  }
}
