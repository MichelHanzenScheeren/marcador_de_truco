import 'dart:io';
import 'package:flutter/material.dart';
import 'package:marcadordetruco/models/player_description.dart';

class ImageContainer extends StatelessWidget {
  final String image;
  final ImageType type;
  final double width;
  final double height;
  final Color borderColor;
  ImageContainer({
    @required this.image,
    @required this.type,
    this.height: 70,
    this.width: 70,
    this.borderColor: Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[350],
        shape: BoxShape.circle,
        border: Border.all(color: borderColor),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: type == ImageType.asset
              ? AssetImage(image)
              : FileImage(File(image)),
        ),
      ),
    );
  }
}
