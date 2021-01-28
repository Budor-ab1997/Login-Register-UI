import 'dart:async';
import 'package:flutter/material.dart';
import 'LogIn.dart';

class SplashScreen extends StatefulWidget {
  static const id = 'splash_screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyImage(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void NavigatorToWelcomeScree() {
    Timer(
      Duration(seconds: 5),
      () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => LogIn())),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NavigatorToWelcomeScree();
  }
}

class MyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage image = AssetImage('image/pic.jpg');
    Image logo = Image(
      image: image,
      width: 500,
      height: 500,
    );
    return logo;
  }
}
