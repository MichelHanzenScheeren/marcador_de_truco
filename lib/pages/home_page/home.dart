import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './widgets/players_images.dart';
import './widgets/players_names.dart';
import '../game_page/game.dart';
import '../../controllers/game_controller.dart';
import '../../models/my_theme.dart';
import '../../models/truco.dart';
import '../../statics/my_players.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../models/player.dart';
import '../../widgets/title_divider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Player player1 = MyPlayers.player1;
  final Player player2 = MyPlayers.player2;
  MyTheme myTheme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    myTheme = Provider.of<MyTheme>(context);
  }

  @override
  Widget build(BuildContext context) {
    final double space = 10;
    final double width = MediaQuery.of(context).size.width;
    final Color primaryColor = Theme.of(context).accentColor;
    final Color secondaryColor = Theme.of(context).splashColor;
    return Scaffold(
      appBar: AppBar(
        title: Text("Marcador de Truco"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.lightbulb_outline),
            onPressed: myTheme.setTheme,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(space),
          child: Form(
            child: Column(
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
                ),
                SizedBox(height: space * 2),
                CustomButton(
                  backGroundColor: primaryColor,
                  buttonText: "Iniciar Partida",
                  textColor: secondaryColor,
                  onPressed: () => initGame(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void initGame(BuildContext context) {
    Truco truco = Truco(player1: player1, player2: player2);
    GameController gameModel = GameController();
    gameModel.addGame(truco);
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => Game(gameModel)),
    );
  }
}
