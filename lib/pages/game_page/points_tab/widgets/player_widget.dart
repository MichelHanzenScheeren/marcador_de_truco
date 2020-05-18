import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../models/truco.dart';
import '../../../../models/player.dart';

class PlayerWidget extends StatelessWidget {
  final Player player;
  final int playerNumber;
  final String incrementImage;
  final Truco truco;

  PlayerWidget({
    @required this.player,
    @required this.playerNumber,
    @required this.incrementImage,
    @required this.truco,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.5,
      height: size.height * 0.5,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.grey[350],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(player.image),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  player.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
            Observer(builder: (_) {
              return Text(
                "${player.points}",
                style: TextStyle(fontSize: 90),
              );
            }),
            InkWell(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Container(
                width: 90,
                height: 90,
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
                        fontSize: 25,
                      ),
                    );
                  }),
                ),
              ),
              onTap: () => truco.incrementPoint(playerNumber),
            )
          ],
        ),
      ),
    );
  }
}
