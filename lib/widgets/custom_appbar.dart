import 'package:flutter/material.dart';
import 'package:marcadordetruco/statics/my_images.dart';

class CustomAppBar extends AppBar {
  final Widget leading;

  CustomAppBar({this.leading})
      : super(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                MyImages.logo,
                fit: BoxFit.fill,
                width: 60,
                height: 60,
              ),
              SizedBox(width: 3),
              Text(
                "Ás de Espada",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        );
}
