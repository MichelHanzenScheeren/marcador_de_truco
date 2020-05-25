import 'package:flutter/material.dart';
import 'package:marcadordetruco/models/player.dart';
import 'package:marcadordetruco/pages/home_page/custom_text_field.dart';
import 'package:marcadordetruco/pages/home_page/players_images.dart';
import 'package:marcadordetruco/statics/project_images.dart';
import 'package:marcadordetruco/widgets/image_container.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Marcador de Truco"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                PlayersImages(player1, player2),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CustomTextField(
                      text: player1.name,
                      playerNumber: "1",
                      changed: player1.setName,
                    ),
                    CustomTextField(
                      text: player2.name,
                      playerNumber: "2",
                      changed: player2.setName,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
