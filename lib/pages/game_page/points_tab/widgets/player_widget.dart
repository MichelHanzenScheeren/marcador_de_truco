import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../models/truco.dart';
import '../../../../models/player.dart';
import '../../../../widgets/image_container.dart';

class PlayerWidget extends StatelessWidget {
  final Player player;
  final String incrementImage;
  final Truco truco;
  final Size size;

  PlayerWidget({
    @required this.player,
    @required this.incrementImage,
    @required this.truco,
    @required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.5,
      height: size.height * 0.65,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ImageContainer(
                    width: 120,
                    height: 120,
                    image: player.description.image,
                    type: player.description.imageType,
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Text(
                      player.description.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
            ),
            Observer(builder: (_) {
              return Text(
                "${player.points}",
                style: TextStyle(fontSize: 85),
              );
            }),
            InkWell(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Container(
                width: 80,
                height: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(incrementImage),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent, shape: BoxShape.circle),
                  child: Observer(builder: (_) {
                    return Text(
                      "${truco.currentValue}",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    );
                  }),
                ),
              ),
              onTap: () => truco.doRound(player.description.playerNumber),
            )
          ],
        ),
      ),
    );
  }
}
