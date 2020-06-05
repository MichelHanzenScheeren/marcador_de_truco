import 'package:flutter/material.dart';

class SwitchComponent extends StatelessWidget {
  final String text;
  final bool isEnabled;
  final Future Function(bool value) function;
  SwitchComponent({
    this.text: "",
    this.isEnabled: true,
    @required this.function,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(color: theme.primaryColor),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: theme.textSelectionColor),
            ),
          ),
          Container(
            width: 70,
            child: Switch(
              materialTapTargetSize: MaterialTapTargetSize.padded,
              value: isEnabled,
              inactiveThumbColor: theme.primaryColor.withAlpha(150),
              inactiveTrackColor: theme.primaryColor.withAlpha(120),
              activeTrackColor: theme.primaryColor.withAlpha(230),
              activeColor: theme.primaryColor,
              onChanged: (value) async => await function(value),
            ),
          ),
        ],
      ),
    );
  }
}
