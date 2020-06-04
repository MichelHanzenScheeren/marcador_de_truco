import 'package:flutter/material.dart';
import 'package:marcadordetruco/pages/home_page/home.dart';
import 'package:marcadordetruco/statics/my_images.dart';
import 'package:marcadordetruco/widgets/waiting_indicator.dart';

class Logo extends StatefulWidget {
  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> curvedAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    curvedAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOutExpo,
    );
    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future.delayed(Duration(milliseconds: 1500));
        controller.dispose();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * 0.85;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurpleAccent, Colors.black],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: width * controller.value,
                  child: ClipOval(
                    child: Image.asset(
                      MyImages.logo,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  child: controller.value == 1.0
                      ? WaitingIndicator(
                          valueColor: Colors.white,
                        )
                      : Container(),
                )
              ],
            );
          }),
    );
  }
}
