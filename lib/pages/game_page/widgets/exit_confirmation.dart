import 'package:flutter/material.dart';
import 'package:marcadordetruco/widgets/custom_button.dart';

class ExitConfirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SimpleDialog(
      contentPadding: EdgeInsets.all(15),
      title: Text(
        "Deseja mesmo sair?\n" + "Todo o progresso atual do jogo será perdido.",
        textAlign: TextAlign.center,
        style: TextStyle(color: theme.textSelectionColor),
      ),
      children: <Widget>[
        SizedBox(height: 5),
        CustomButton(
          backGroundColor: theme.dialogBackgroundColor,
          borderColor: theme.errorColor,
          buttonText: "SAIR",
          textColor: theme.errorColor,
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
        SizedBox(height: 10),
        CustomButton(
          backGroundColor: theme.primaryColor,
          borderColor: theme.primaryColor,
          buttonText: "CANCELAR",
          textColor: theme.textSelectionHandleColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
