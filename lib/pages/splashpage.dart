import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lottie/lottie.dart';
import 'dashboard.dart';

class SplashPage extends StatefulWidget {
  SplashPage({key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 4200), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: 300,
          width: 300,
          child: Lottie.asset("img/splash_animation.json"),
        ),
        Text(
          "Health Scale",
          style: TextStyle(
            fontSize: 35,
            color: Color.fromRGBO(61, 96, 152, 1),
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
          ),
        ),
      ]),
    )));
  }
}
