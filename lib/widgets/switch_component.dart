import 'package:flutter/material.dart';

class SwitchComponent extends StatelessWidget {
  final bool isDarkTheme;
  final Function(bool value) setTheme;
  SwitchComponent(this.isDarkTheme, this.setTheme);

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
              "Modo Noturno:",
              style: TextStyle(color: theme.textSelectionColor),
            ),
          ),
          Container(
            width: 80,
            child: Switch(
              materialTapTargetSize: MaterialTapTargetSize.padded,
              value: isDarkTheme,
              inactiveThumbColor: theme.backgroundColor,
              inactiveTrackColor: theme.hintColor,
              activeTrackColor: theme.hintColor,
              activeColor: theme.focusColor,
              onChanged: setTheme,
            ),
          ),
        ],
      ),
    );
  }
}
