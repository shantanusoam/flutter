import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:dictionary/activities/FormPage.dart';
import 'package:dictionary/activities/loading.dart';
import 'package:dictionary/wrapper.dart';
import 'package:dictionary/authentication.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupState createState() => new _SignupState();
}

class _SignupState extends State<SignupPage> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  bool loading = false;

  String _email;
  String _password;
  String error = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      setState(() {
        loading = true;
      });
      performSignup();
      //performLogin();
    }
  }

  void performSignup() async {
    dynamic result =
        await _auth.registerWithEmailAndPassword(_email, _password);

    if (result == null) {
      setState(() {
        error = 'Oops! This email is already taken by someone else';
        loading = false;
      });
    } else {
      performLogin();
    }
  }

  void performLogin() async {
    dynamic result =
        await _auth.signInUserWithEmailAndPassword(_email, _password);
    if (result == null) {
      setState(() {
        error = 'Invalid Email or Password';
        loading = false;
      });
    }
    setState(() {
      loading = false;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Wrapper()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
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
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 70.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "WordSeeker",
                          style: TextStyle(
                              fontFamily: "Signatra",
                              fontSize: 70.0,
                              color: Colors.white),
                        ),
                        Padding(padding: const EdgeInsets.only(bottom: 50.0)),
                        Shimmer.fromColors(
                          child: Text(
                            "Sign up here",
                            style: TextStyle(
                              fontFamily: "Signatra",
                              fontSize: 25.0,
                              color: Colors.white,
                            ),
                            textScaleFactor: 1.4,
                          ),
                          baseColor: Colors.pink[100],
                          highlightColor: Colors.blue,
                        ),
                        Padding(padding: const EdgeInsets.only(bottom: 20.0)),
                        Theme(
                          data: ThemeData(
                            //primaryColor: Colors.white,
                            primaryColorDark: Colors.white,
                          ),
                          child: Form(
                            key: formKey,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 30.0, right: 30.0),
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  TextFormField(
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    decoration: new InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.white, width: 2.0),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.teal, width: 2.0),
                                      ),
                                      labelText: "Email",
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      prefixIcon: const Icon(
                                        Icons.email,
                                        color: Colors.white,
                                      ),
                                    ),
                                    validator: (val) =>
                                        // if (error.length != 0) {
                                        //   return "Email already taken by someone else";
                                        // } else if (!val.contains('@')) {
                                        //   return "Invalid Email";
                                        // } else {
                                        //   return null;
                                        // }
                                        !val.contains('@')
                                            ? "invalid email"
                                            : null,
                                    onSaved: (val) => _email = val,
                                  ),
                                  Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10.0)),
                                  new TextFormField(
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    decoration: new InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.white, width: 2.0),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.teal, width: 2.0),
                                      ),
                                      labelText: "Password",
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      fillColor: Colors.white,
                                      prefixIcon: const Icon(
                                        Icons.lock,
                                        color: Colors.white,
                                      ),
                                    ),
                                    validator: (val) => val.length < 6
                                        ? 'Password too short'
                                        : null,
                                    onSaved: (val) => _password = val,
                                    obscureText: true,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      error,
                                      style: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 18.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20.0, bottom: 40.0),
                                    child: ButtonTheme(
                                      minWidth: 130,
                                      height: 50,
                                      child: RaisedButton(
                                        child: new Text(
                                          "Register",
                                          style: new TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0),
                                        ),
                                        color: Colors.blue,
                                        onPressed: _submit,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => FormPage())),
                                    child: Shimmer.fromColors(
                                      child: Text(
                                        "Already have one? Go back",
                                        style: TextStyle(
                                          fontFamily: "Signatra",
                                          fontSize: 25.0,
                                          color: Colors.white,
                                        ),
                                        textScaleFactor: 1.0,
                                      ),
                                      baseColor: Colors.pink[100],
                                      highlightColor: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
