import 'package:flutter/material.dart';
import 'SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: SplashScreen.id,
      // the first page when you open the app ..
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
      },
    );
  }
}
