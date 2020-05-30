import 'package:flutter/material.dart';

class WaitingIndicator extends StatelessWidget {
  final double size;
  final Color valueColor;
  WaitingIndicator({
    this.size: 100,
    this.valueColor: Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(valueColor),
      ),
    );
  }
}
