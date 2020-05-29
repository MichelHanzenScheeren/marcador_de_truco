import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcadordetruco/controllers/game_controller.dart';
import 'package:marcadordetruco/controllers/home_controller.dart';
import 'package:marcadordetruco/models/player.dart';
import 'package:marcadordetruco/models/player_description.dart';
import 'package:marcadordetruco/models/truco.dart';
import 'package:marcadordetruco/pages/game_page/game.dart';
import 'package:marcadordetruco/pages/home_page/widgets/init_game/widgets/players_images.dart';
import 'package:marcadordetruco/pages/home_page/widgets/init_game/widgets/players_names.dart';
import 'package:marcadordetruco/statics/my_players.dart';
import 'package:marcadordetruco/validators/form_validators.dart';
import 'package:marcadordetruco/widgets/custom_button.dart';
import 'package:marcadordetruco/widgets/custom_text_field.dart';
import 'package:marcadordetruco/widgets/title_divider.dart';
import 'package:marcadordetruco/widgets/waiting_indicator.dart';

class InitGame extends StatelessWidget {
  final PlayerDescription p1Description = MyPlayers.p1Description;
  final PlayerDescription p2Description = MyPlayers.p2Description;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final HomeController homeController;
  InitGame(this.homeController);

  @override
  Widget build(BuildContext context) {
    final double space = 10;
    final width = MediaQuery.of(context).size.width;
    final primaryColor = Theme.of(context).accentColor;
    final secondaryColor = Theme.of(context).splashColor;
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
                dividerColor: primaryColor,
              ),
              SizedBox(height: space),
              PlayersImages(
                p1Description: this.p1Description,
                p2Description: this.p2Description,
                imageSize: (width / 2) - (space * 1.5),
              ),
              SizedBox(height: space),
              PlayersNames(
                p1Description: this.p1Description,
                p2Description: this.p2Description,
                space: space,
              ),
              SizedBox(height: 2 * space),
              TitleDivider(
                text: "Configurações da Partida",
                dividerColor: primaryColor,
              ),
              SizedBox(height: space),
              CustomTextField(
                initialValue: "12",
                label: "Máximo de Pontos",
                keyboardType: TextInputType.number,
                validator: FormValidators.maxPoint,
                changed: homeController.setMaxPoints,
              ),
              SizedBox(height: space * 2),
              Observer(builder: (context) {
                if (homeController.isLoading) {
                  return WaitingIndicator(
                    size: 50,
                    backGroundColor: primaryColor,
                    valueColor: secondaryColor,
                  );
                }
                return CustomButton(
                  backGroundColor: primaryColor,
                  buttonText: "Iniciar Partida",
                  textColor: secondaryColor,
                  onPressed: () => initGame(context),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  void initGame(BuildContext context) {
    if (!formKey.currentState.validate()) return;

    homeController.setLoading(true);
    FocusScope.of(context).requestFocus(FocusNode());
    GameController gameController = GameController();
    gameController.addGame(Truco(
      player1: Player(description: p1Description),
      player2: Player(description: p2Description),
      maxPoints: int.parse(homeController.maxPoints),
    ));
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => Game(gameController)),
    );
    homeController.setLoading(false);
  }
}
