import 'package:flutter/material.dart';

class GameRounds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Rodadas:", style: TextStyle(fontSize: 30)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  shape: BoxShape.circle,
                ),
                child: Text("1ª"),
              ),
              SizedBox(width: 5),
              Text(
                'Marcou 1 ponto',
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                'Marcou 1 ponto',
                textAlign: TextAlign.right,
              ),
              SizedBox(width: 5),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  shape: BoxShape.circle,
                ),
                child: Text("2ª"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
