import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
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
          Center(
            child: SpinKitPulse(
              color: Colors.white,
              size: 100.0,
            ),
          ),
        ],
      ),
    );
    // Container(
    //   color: Colors.indigo[100],
    //   child: Center(
    //     child: SpinKitPulse(
    //       color: Colors.indigo,
    //       size: 50.0,
    //     ),
    //   ),
    // );
  }
}
