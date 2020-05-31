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
      color: Theme.of(context).backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      height: 70,
      child: IconButton(
        icon: Icon(
          Icons.delete_forever,
          size: 50,
          color: Colors.red,
        ),
        onPressed: () => showExcludeDialog(context),
      ),
    );
  }

  void showExcludeDialog(BuildContext context) {
    showDialog(
      context: context,
      child: SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(
          "Tem certeza?\n" + "Registros apagados não podem ser recuperados!",
          textAlign: TextAlign.center,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        contentPadding: EdgeInsets.all(15),
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
                    valueColor: Theme.of(context).primaryColor,
                  ),
                ),
              );
            }
            return CustomButton(
              backGroundColor: Theme.of(context).backgroundColor,
              borderColor: Colors.red,
              buttonText: "APAGAR",
              textColor: Colors.red,
              onPressed: () async {
                await homeController.deleteRegister(trucoID);
                close(context);
              },
            );
          }),
          SizedBox(height: 10),
          CustomButton(
            backGroundColor: Theme.of(context).primaryColor,
            borderColor: Colors.transparent,
            buttonText: "CANCELAR",
            textColor: Colors.white,
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
