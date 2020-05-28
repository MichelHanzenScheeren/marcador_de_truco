import 'package:flutter/material.dart';

class WaitingIndicator extends StatelessWidget {
  final double size;
  final Color valueColor;
  final Color backGroundColor;
  WaitingIndicator({
    this.size,
    this.valueColor: Colors.white,
    this.backGroundColor: Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size + 10,
      height: size + 10,
      decoration: BoxDecoration(
        color: backGroundColor,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        backgroundColor: Colors.transparent,
        valueColor: AlwaysStoppedAnimation<Color>(valueColor),
      ),
    );
  }
}
