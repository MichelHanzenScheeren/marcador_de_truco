import 'package:flutter/material.dart';
import 'package:marcadordetruco/widgets/waiting_indicator.dart';

class SwitchComponent extends StatelessWidget {
  final bool isDarkTheme;
  final Function(bool value) setTheme;
  final bool isLoading;
  SwitchComponent(this.isDarkTheme, this.setTheme, this.isLoading);

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
          isLoading
              ? Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 45,
                  padding: EdgeInsets.fromLTRB(0, 5, 15, 5),
                  child: WaitingIndicator(
                    valueColor: theme.primaryColor,
                    size: 40,
                  ),
                )
              : Container(
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
