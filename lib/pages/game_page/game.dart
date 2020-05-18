import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Marcador de truco"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            indicatorColor: Theme.of(context).hintColor,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.play_circle_filled),
              ),
              Tab(icon: Icon(Icons.history)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(color: Colors.purple),
            Container(color: Colors.deepPurple),
          ],
        ),
      ),
    );
  }
}
