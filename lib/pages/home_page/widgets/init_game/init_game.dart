import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcadordetruco/controllers/home_controller.dart';
import 'package:marcadordetruco/models/my_theme.dart';
import 'package:marcadordetruco/pages/home_page/widgets/init_game/widgets/players_images.dart';
import 'package:marcadordetruco/pages/home_page/widgets/init_game/widgets/players_names.dart';
import 'package:marcadordetruco/widgets/custom_button.dart';
import 'package:marcadordetruco/widgets/custom_text_field.dart';
import 'package:marcadordetruco/widgets/switch_component.dart';
import 'package:marcadordetruco/widgets/title_divider.dart';

class InitGame extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final HomeController homeController;
  final MyTheme mytheme;
  InitGame(this.homeController, this.mytheme);

  @override
  Widget build(BuildContext context) {
    final double space = 10;
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(space),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: space),
              TitleDivider(
                text: "Jogadores",
                textColor: theme.textSelectionColor,
                dividerColor: theme.primaryColor,
              ),
              SizedBox(height: space),
              PlayersImages(
                p1Description: homeController.p1Desc,
                p2Description: homeController.p2Desc,
                imageSize: (width / 2) - (space * 1.5),
              ),
              SizedBox(height: space),
              PlayersNames(
                p1Description: homeController.p1Desc,
                p2Description: homeController.p2Desc,
                validateName: homeController.validateName,
                space: space,
              ),
              SizedBox(height: 2 * space),
              TitleDivider(
                text: "Configurações da Partida",
                textColor: theme.textSelectionColor,
                dividerColor: theme.primaryColor,
              ),
              SizedBox(height: space),
              CustomTextField(
                initialValue: "12",
                label: "Máximo de Pontos",
                keyboardType: TextInputType.number,
                validator: homeController.validateMaxPoints,
                changed: homeController.setMaxPoints,
              ),
              SizedBox(height: space),
              Observer(builder: (_) {
                return SwitchComponent(
                  mytheme.isDarkTheme,
                  mytheme.setTheme,
                );
              }),
              SizedBox(height: space * 2),
              CustomButton(
                backGroundColor: theme.primaryColor,
                buttonText: "Iniciar Partida",
                textColor: theme.textSelectionHandleColor,
                onPressed: () => initGame(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void initGame(BuildContext context) {
    if (!formKey.currentState.validate()) return;

    FocusScope.of(context).requestFocus(FocusNode());
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => homeController.initGame()),
    );
  }
}
