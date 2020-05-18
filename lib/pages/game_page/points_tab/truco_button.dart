import 'package:flutter/material.dart';

class TrucoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      width: 220,
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            cardImage(),
            Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                "Truco!",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            cardImage(),
          ],
        ),
        onTap: () {},
      ),
    );
  }

  Widget cardImage() {
    return Image.asset(
      "images/truco.png",
      fit: BoxFit.fill,
      height: 45,
      width: 45,
    );
  }
}
