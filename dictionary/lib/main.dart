import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/authentication.dart';
import 'package:dictionary/models/user.dart';
import 'package:provider/provider.dart';

import 'activities/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "WordSeeker",
        theme: ThemeData(
          primaryColor: Colors.cyan,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
