import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../models/truco.dart';
import '../../../../statics/project_images.dart';

class TrucoButton extends StatelessWidget {
  final Truco truco;
  TrucoButton({@required this.truco});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      width: 230,
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            cardImage(),
            Padding(
              padding: EdgeInsets.all(5),
              child: Observer(builder: (_) {
                return Text(
                  truco.getTrucoText,
                  style: TextStyle(fontSize: 30, color: Colors.white),
                );
              }),
            ),
            cardImage(),
          ],
        ),
        onTap: truco.setCurrentValue,
      ),
    );
  }

  Widget cardImage() {
    return Image.asset(
      MyImages.truco,
      fit: BoxFit.fill,
      height: 45,
      width: 45,
    );
  }
}
