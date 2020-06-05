import 'package:flutter/material.dart';
import 'package:marcadordetruco/statics/my_images.dart';

class CustomAppBar extends AppBar {
  final BuildContext context;
  final bool hasBottom;

  CustomAppBar(this.context, {this.hasBottom: false})
      : super(
          title: Row(
            children: <Widget>[
              Image.asset(
                MyImages.logo,
                fit: BoxFit.fill,
                width: 55,
                height: 55,
              ),
              SizedBox(width: 3),
              Text(
                "Ás de Espada",
                style: TextStyle(
                    color: Theme.of(context).textSelectionHandleColor),
              ),
            ],
          ),
          bottom: hasBottom
              ? TabBar(
                  indicatorColor: Theme.of(context).textSelectionColor,
                  tabs: <Widget>[
                    Tab(icon: Icon(Icons.play_circle_filled)),
                    Tab(icon: Icon(Icons.list)),
                  ],
                )
              : null,
        );
}
