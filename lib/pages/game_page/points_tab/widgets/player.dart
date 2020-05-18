import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  final String playerName;
  final String playerImage;
  final String points;
  final String incrementImage;

  Player({
    this.playerName: "",
    this.playerImage: "images/player1.png",
    this.points: "0",
    this.incrementImage: "images/increment_left.png",
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
                      image: AssetImage(playerImage),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  playerName,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
            Text(
              points,
              style: TextStyle(fontSize: 90),
            ),
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
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent, shape: BoxShape.circle),
                  child: Text(
                    "+1",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
