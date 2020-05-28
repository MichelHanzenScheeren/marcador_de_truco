import 'package:flutter/material.dart';
import 'package:marcadordetruco/controllers/game_controller.dart';
import 'package:marcadordetruco/models/player.dart';
import 'package:marcadordetruco/models/truco.dart';
import 'package:marcadordetruco/pages/game_page/game.dart';
import 'package:marcadordetruco/pages/home_page/widgets/init_game/widgets/players_images.dart';
import 'package:marcadordetruco/pages/home_page/widgets/init_game/widgets/players_names.dart';
import 'package:marcadordetruco/statics/my_players.dart';
import 'package:marcadordetruco/validators/form_validators.dart';
import 'package:marcadordetruco/widgets/custom_button.dart';
import 'package:marcadordetruco/widgets/custom_text_field.dart';
import 'package:marcadordetruco/widgets/title_divider.dart';

class InitGame extends StatelessWidget {
  final double space = 10;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Player player1 = MyPlayers.player1;
  final Player player2 = MyPlayers.player2;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final Color primaryColor = Theme.of(context).accentColor;
    final Color secondaryColor = Theme.of(context).splashColor;
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
                player1: player1,
                player2: player2,
                imageSize: (width / 2) - space - (space / 2),
              ),
              SizedBox(height: space),
              PlayersNames(
                player1: player1,
                player2: player2,
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
              ),
              SizedBox(height: space * 2),
              CustomButton(
                backGroundColor: primaryColor,
                buttonText: "Iniciar Partida",
                textColor: secondaryColor,
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    initGame(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void initGame(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    GameController gameController = GameController();
    gameController.addGame(Truco(player1: player1, player2: player2));
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => Game(gameController)),
    );
  }
}
