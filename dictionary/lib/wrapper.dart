import 'package:dictionary/activities/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/activities/FormPage.dart';
import 'package:dictionary/models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);

    if (user == null) {
      return FormPage();
    } else {
      return HomeScreen();
    }
  }
}
