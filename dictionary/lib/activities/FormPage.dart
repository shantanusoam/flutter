import 'package:flutter/material.dart';
import 'package:dictionary/activities/loading.dart';
import 'package:dictionary/activities/signup_page.dart';
import 'package:dictionary/authentication.dart';
import 'package:shimmer/shimmer.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => new _FormPageState();
}

class _FormPageState extends State<FormPage> {
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
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "wordseeker",
                          style: TextStyle(
                              fontFamily: "Signatra",
                              fontSize: 70.0,
                              color: Colors.white),
                        ),
                        Padding(padding: const EdgeInsets.only(bottom: 50.0)),
                        Shimmer.fromColors(
                          child: Text(
                            "Log in here",
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
                                      labelText: "Email",
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      prefixIcon: const Icon(
                                        Icons.person,
                                        color: Colors.white,
                                      ),
                                    ),
                                    validator: (val) => !val.contains('@')
                                        ? 'Invalid Email'
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
                                        ? "password too short"
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
                                          "login",
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
                                            builder: (context) =>
                                                SignupPage())),
                                    child: Shimmer.fromColors(
                                      child: Text(
                                        "Don't have one? Create it",
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
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(children: <Widget>[
                                      Expanded(
                                          child: Divider(
                                        color: Colors.white,
                                      )),
                                      Text(
                                        "OR",
                                        style: TextStyle(
                                          fontFamily: "Signatra",
                                          fontSize: 40.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Expanded(
                                        child: Divider(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ]),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      setState(() {
                                        loading = true;
                                      });
                                      bool res = await _auth.loginWithGoogle();

                                      //Scaffold.of(context).showSnackBar(
                                      //  SnackBar(content: Text("Logging in...")));
                                      // _openLoadingDialog(context);
                                      // if (res) {
                                      //   Navigator.of(context).pop();
                                      // }
                                      if (!res) {
                                        setState(() {
                                          loading = true;
                                        });
                                        print("error");
                                      }
                                    },
                                    child: Container(
                                      width: 260.0,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/google_signin_button.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 40.0))
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
