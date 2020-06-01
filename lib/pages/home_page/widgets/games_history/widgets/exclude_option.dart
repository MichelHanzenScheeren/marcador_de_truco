import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcadordetruco/controllers/home_controller.dart';
import 'package:marcadordetruco/widgets/custom_button.dart';
import 'package:marcadordetruco/widgets/waiting_indicator.dart';

class ExcludeOption extends StatelessWidget {
  final HomeController homeController;
  final int trucoID;
  ExcludeOption(this.homeController, this.trucoID);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      height: 80,
      child: IconButton(
        icon: Icon(
          Icons.delete_forever,
          size: 60,
          color: Theme.of(context).errorColor,
        ),
        onPressed: () => showExcludeDialog(context),
      ),
    );
  }

  void showExcludeDialog(BuildContext context) {
    final theme = Theme.of(context);
    showDialog(
      context: context,
      child: SimpleDialog(
        contentPadding: EdgeInsets.all(15),
        title: Text(
          "Tem certeza?\n" + "Registros apagados não podem ser recuperados!",
          textAlign: TextAlign.center,
          style: TextStyle(color: theme.textSelectionColor),
        ),
        children: <Widget>[
          SizedBox(height: 5),
          Observer(builder: (_) {
            if (homeController.isLoading) {
              return Container(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: WaitingIndicator(
                    valueColor: theme.primaryColor,
                  ),
                ),
              );
            }
            return CustomButton(
              backGroundColor: theme.dialogBackgroundColor,
              borderColor: theme.errorColor,
              buttonText: "APAGAR",
              textColor: theme.errorColor,
              onPressed: () async {
                await homeController.deleteRegister(trucoID);
                close(context);
              },
            );
          }),
          SizedBox(height: 10),
          CustomButton(
            backGroundColor: theme.primaryColor,
            borderColor: theme.primaryColor,
            buttonText: "CANCELAR",
            textColor: theme.textSelectionHandleColor,
            onPressed: () {
              close(context);
            },
          ),
        ],
      ),
    );
  }

  void close(BuildContext context) {
    Navigator.pop(context);
    Navigator.pop(context);
  }
}
