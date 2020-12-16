import 'package:dictionary/authentication.dart';
import 'package:dictionary/categories/category2.dart';
import 'package:dictionary/categories/category4.dart';
import 'package:dictionary/categories/category5.dart';
import 'package:dictionary/categories/category6.dart';
import 'package:dictionary/categories/category7.dart';
import 'package:dictionary/categories/category8.dart';
import 'package:dictionary/categories/category9.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:dictionary/categories/category1.dart';
import 'package:firebase_admob/firebase_admob.dart';

import 'dictionary_screen.dart';

const String testDevice = '';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _auth = AuthService();
  static final MobileAdTargetingInfo targetInfo = MobileAdTargetingInfo(
    testDevices: <String>[],
    keywords: <String>[],
    childDirected: true,
  );

  BannerAd _bannerAd;
  InterstitialAd _interstitialAd;

  BannerAd createBannerAd() {
    return BannerAd(
        adUnitId: "ca-app-pub-4590661625161952/7798406880",
        size: AdSize.banner,
        targetingInfo: targetInfo,
        listener: (MobileAdEvent event) {
          print("Banner event: $event");
        });
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
        adUnitId: "ca-app-pub-4590661625161952/5533004490",
        targetingInfo: targetInfo,
        listener: (MobileAdEvent event) {
          print("Interstitial event: $event");
        });
  }

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance
        .initialize(appId: "ca-app-pub-4590661625161952~1579293527");
    _bannerAd = createBannerAd()
      ..load()
      ..show();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "WordSeeker",
          style: TextStyle(
            fontFamily: "Signatra",
            fontSize: 50.0,
            color: Colors.black,
          ),
        ),
        elevation: 0.01,
        centerTitle: true,
      ),
      backgroundColor: Colors.blue[100],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Neumorphic(
            style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                depth: -5,
                lightSource: LightSource.topLeft,
                color: Colors.cyan[300]),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                    right: 16.0,
                    left: 16.0,
                    bottom: 20.0,
                  ),
                  child: Row(
                    children: [
                      NeumorphicButton(
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(16)),
                        ),
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                height: 110,
                                width: 120,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/search.png'),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Text(
                                "Synonymss",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          createInterstitialAd()
                            ..load()
                            ..show();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => Category1(),
                            ),
                          );
                        },
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              children: [
                                Text(
                                  "words with a meaning similar to sentence",
                                  style: TextStyle(

                                      //fontFamily: "Signatra",
                                      fontSize: 20.0,
                                      color: Colors.black),
                                ),
                                Text(
                                  "for example if you time something than it give something else",
                                  style: TextStyle(

                                      //fontFamily: "Signatra",
                                      fontSize: 15.0,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                    right: 16.0,
                    left: 16.0,
                    bottom: 20.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "words related to a word that start with a word of your choice",
                            style: TextStyle(

                                //fontFamily: "Signatra",
                                fontSize: 15.0,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      NeumorphicButton(
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(25)),
                        ),
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                height: 110,
                                width: 120,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/prefix.png'),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Text(
                                "Search Words",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => Category2(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                    right: 16.0,
                    left: 16.0,
                    bottom: 20.0,
                  ),
                  child: Row(
                    children: [
                      NeumorphicButton(
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(25)),
                        ),
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                height: 110,
                                width: 120,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/songwriter.png'),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Text(
                                "Search Words",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          createInterstitialAd()
                            ..load()
                            ..show();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => Category4(),
                            ),
                          );
                        },
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "words that sound like any word",
                            style: TextStyle(

                                //fontFamily: "Signatra",
                                fontSize: 15.0,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                    right: 16.0,
                    left: 16.0,
                    bottom: 20.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "words that are spelled similar to any perticular word",
                            style: TextStyle(

                                //fontFamily: "Signatra",
                                fontSize: 15.0,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      NeumorphicButton(
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(25)),
                        ),
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                height: 110,
                                width: 120,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/spelled_similar.png'),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Text(
                                "homonym Words",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => Category5(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                    right: 16.0,
                    left: 16.0,
                    bottom: 20.0,
                  ),
                  child: Row(
                    children: [
                      NeumorphicButton(
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(25)),
                        ),
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                height: 110,
                                width: 120,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/search.png'),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Text(
                                "Search Words",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          createInterstitialAd()
                            ..load()
                            ..show();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => Category6(),
                            ),
                          );
                        },
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "words that rhyme with any word",
                            style: TextStyle(

                                //fontFamily: "Signatra",
                                fontSize: 15.0,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                    right: 16.0,
                    left: 16.0,
                    bottom: 20.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "adjectives that are often used to describe something",
                            style: TextStyle(

                                //fontFamily: "Signatra",
                                fontSize: 15.0,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      NeumorphicButton(
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(25)),
                        ),
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                height: 110,
                                width: 120,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/adj.png'),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Text(
                                "describe Words",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => Category7(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                    right: 16.0,
                    left: 16.0,
                    bottom: 20.0,
                  ),
                  child: Row(
                    children: [
                      NeumorphicButton(
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(25)),
                        ),
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                height: 110,
                                width: 120,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/noun.png'),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Text(
                                "with + Words",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => Category8(),
                            ),
                          );
                        },
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "nouns that are often described by any adjective",
                            style: TextStyle(

                                //fontFamily: "Signatra",
                                fontSize: 15.0,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                    right: 16.0,
                    left: 16.0,
                    bottom: 20.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "suggestions for the word if you have typed in something so far",
                            style: TextStyle(

                                //fontFamily: "Signatra",
                                fontSize: 15.0,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      NeumorphicButton(
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(25)),
                        ),
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                height: 110,
                                width: 120,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/sug.png'),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Text(
                                "Search Words",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => Category9(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors
              .cyan[100], //This will change the drawer background to blue.
          //other styles
        ),
        child: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.cyan[100],
                ),
                accountName: Center(
                  child: NeumorphicText(
                    "WordSeeker",
                    style: NeumorphicStyle(
                      depth: 4, //customize depth here
                      color: Colors.cyan[500],
                      //customize color here
                    ),
                    textStyle: NeumorphicTextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Signatra",

                      //customize size here
                      // AND others usual text style properties (fontFamily, fontWeight, ...)
                    ),
                  ),
                ),
                accountEmail: null,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 30.0, right: 30.0, bottom: 30.0, top: 100.0),
                  child: Neumorphic(
                    style: NeumorphicStyle(
                        shape: NeumorphicShape.flat,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(12)),
                        depth: -5,
                        lightSource: LightSource.topLeft,
                        color: Colors.cyan[300]),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HomeScreen(),
                                ),
                              );
                            },
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                  shape: NeumorphicShape.flat,
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(12)),
                                  depth: 5,
                                  lightSource: LightSource.topLeft,
                                  color: Colors.cyan[100]),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Out of words? \n just search it here!",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.cyan[600],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, bottom: 70.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Dictionary(),
                                ),
                              );
                            },
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                  shape: NeumorphicShape.flat,
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(12)),
                                  depth: 5,
                                  lightSource: LightSource.topLeft,
                                  color: Colors.cyan[100]),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Wanna find just meaning? \n just search it here!",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.cyan[600],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () async {
                              await _auth.signOut();
                              Navigator.of(context).pop();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, right: 16.0),
                              child: Neumorphic(
                                style: NeumorphicStyle(
                                    shape: NeumorphicShape.flat,
                                    boxShape: NeumorphicBoxShape.roundRect(
                                        BorderRadius.circular(12)),
                                    depth: 5,
                                    lightSource: LightSource.topLeft,
                                    color: Colors.cyan[100]),
                                //color: Colors.blue[500],
                                child: Center(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: Neumorphic(
                                          style: NeumorphicStyle(
                                              shape: NeumorphicShape.flat,
                                              boxShape:
                                                  NeumorphicBoxShape.circle(),
                                              depth: -5,
                                              lightSource: LightSource.topLeft,
                                              color: Colors.cyan[300]),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.logout,
                                              size: 30.0,
                                              color: Colors.white70,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Container(
                                            child: Neumorphic(
                                              style: NeumorphicStyle(
                                                  shape: NeumorphicShape.flat,
                                                  boxShape: NeumorphicBoxShape
                                                      .roundRect(
                                                          BorderRadius.circular(
                                                              12)),
                                                  depth: -5,
                                                  lightSource:
                                                      LightSource.topLeft,
                                                  color: Colors.cyan[300]),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Text(
                                                  "Sign out",
                                                  style: TextStyle(

                                                      //fontFamily: "Signatra",
                                                      fontSize: 18.0,
                                                      color: Colors.white),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
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
      ),
    );
  }
}
