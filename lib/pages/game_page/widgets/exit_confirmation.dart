import 'package:flutter/material.dart';
import 'package:marcadordetruco/widgets/custom_button.dart';

class ExitConfirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text(
        "Deseja mesmo sair?\n" + "Todo o progresso atual do jogo será perdido.",
        textAlign: TextAlign.center,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      contentPadding: EdgeInsets.all(15),
      children: <Widget>[
        SizedBox(height: 5),
        CustomButton(
          backGroundColor: Theme.of(context).backgroundColor,
          borderColor: Colors.red,
          buttonText: "SAIR",
          textColor: Colors.red,
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
        SizedBox(height: 10),
        CustomButton(
          backGroundColor: Theme.of(context).primaryColor,
          borderColor: Colors.transparent,
          buttonText: "CANCELAR",
          textColor: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
