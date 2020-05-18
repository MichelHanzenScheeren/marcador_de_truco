import 'package:flutter/material.dart';

class GameScore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Nós", style: TextStyle(fontSize: 18)),
              Text("Eles", style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ClipOval(
              child: Image.asset(
                "images/player1.png",
                fit: BoxFit.fill,
                width: 70,
                height: 70,
              ),
            ),
            Text("12", style: TextStyle(fontSize: 40)),
            Text("X", style: TextStyle(fontSize: 40)),
            Text("8", style: TextStyle(fontSize: 40)),
            ClipOval(
              child: Image.asset(
                "images/player2.png",
                fit: BoxFit.fill,
                width: 70,
                height: 70,
              ),
            ),
          ],
        ),
      ],
    );
  }
}