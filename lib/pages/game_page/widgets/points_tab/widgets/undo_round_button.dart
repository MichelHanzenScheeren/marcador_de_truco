import 'package:flutter/material.dart';

class UndoRoundButton extends StatelessWidget {
  final Function undoFunction;
  UndoRoundButton({this.undoFunction});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: theme.hintColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Desfazer rodada",
                style: TextStyle(color: theme.textSelectionColor),
              ),
              SizedBox(width: 5),
              Icon(Icons.settings_backup_restore),
            ],
          ),
        ),
        onTap: undoFunction,
      ),
    );
  }
}
