import 'package:flutter/material.dart';
import '../../../../models/player.dart';

class EditImagePlayer extends StatelessWidget {
  final Player player;
  EditImagePlayer(this.player);

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(player.image),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: InkWell(
                      child: Text("Imagem do app"),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: InkWell(
                      child: Text("Imagem da galeria"),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
      onClosing: () {},
    );
  }
}
