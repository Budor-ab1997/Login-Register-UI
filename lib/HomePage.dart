import 'package:flutter/material.dart';
import 'package:countdown_flutter/countdown_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Text('الصفحة الرئيسية'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Center(
              child: CountdownFormatted(
                duration: Duration(seconds: 90),
                builder: (BuildContext ctx, String remaining) {
                  return Text(
                    remaining,
                    style:
                        TextStyle(fontSize: 80, color: Colors.deepPurpleAccent),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
