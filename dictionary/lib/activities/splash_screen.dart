import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:dictionary/wrapper.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Wrapper())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.teal, Colors.purple])),
            child: Image(
              image: AssetImage("assets/splash_bg.jpg"),
              fit: BoxFit.cover,
              color: Colors.black54,
              colorBlendMode: BlendMode.darken,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "wordSeeker",
                style: TextStyle(
                    fontFamily: "Signatra",
                    fontSize: 70.0,
                    color: Colors.white),
              ),
              Padding(padding: const EdgeInsets.only(top: 200.0)),
              SpinKitPulse(
                color: Colors.white,
                size: 70.0,
              ),
              Padding(padding: const EdgeInsets.only(bottom: 30.0)),
              Text(
                "Crux of daily word in a visit",
                style: TextStyle(fontSize: 15.0, color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
