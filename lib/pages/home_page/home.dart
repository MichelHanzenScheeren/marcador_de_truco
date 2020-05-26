import 'package:flutter/material.dart';
import 'package:marcadordetruco/pages/home_page/widgets/players_names.dart';
import 'package:marcadordetruco/widgets/custom_button.dart';
import './widgets/players_images.dart';
import '../../widgets/custom_text_field.dart';
import '../../statics/project_images.dart';
import '../../models/player.dart';
import '../../widgets/title_divider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Player player1 = Player(
    image: MyImages.player1,
    imageType: ImageType.asset,
    name: "Nós",
    playerNumber: Players.p1,
  );
  final Player player2 = Player(
    image: MyImages.player2,
    imageType: ImageType.asset,
    name: "Eles",
    playerNumber: Players.p2,
  );
  final maxPointsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double space = 10;
    final double width = MediaQuery.of(context).size.width;
    final Color primaryColor = Theme.of(context).accentColor;
    final Color secondaryColor = Theme.of(context).splashColor;
    return Scaffold(
      appBar: AppBar(
        title: Text("Marcador de Truco"),
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
                  textController: maxPointsController,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: space * 2),
                CustomButton(
                  backGroundColor: primaryColor,
                  buttonText: "Iniciar Partida",
                  textColor: secondaryColor,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
