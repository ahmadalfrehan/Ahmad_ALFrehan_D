/*import 'dart:async';
import 'package:flutter/material.dart';
import 'main.dart';

class Spalsh_Screen extends StatefulWidget {
  @override
  _Spalsh_ScreenState createState() => _Spalsh_ScreenState();
}

class _Spalsh_ScreenState extends State<Spalsh_Screen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyApp())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Created by Ahmad ALFrehan",
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ));
  }
}
*/