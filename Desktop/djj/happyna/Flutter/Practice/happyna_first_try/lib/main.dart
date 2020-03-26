import 'package:flutter/material.dart';
import 'package:happynafirsttry/widget/HomePage.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MaterialApp(title: "happyna.com", home: MyHome()));

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: HomePage(),
      image: Image.asset(
        'assets/images/splash_page.png',
        fit: BoxFit.cover,
      ),
      backgroundColor: Colors.white,
      photoSize: 150.0,
      loaderColor: Colors.white,
    );
  }
}

