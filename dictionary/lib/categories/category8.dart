import 'dart:convert';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:dictionary/activities/meaning.dart';

class Category8 extends StatefulWidget {
  @override
  _Category8State createState() => _Category8State();
}

class _Category8State extends State<Category8> {
  final formKey = new GlobalKey<FormState>();
  bool loaded = false;
  String word;
  var dataAll;

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      fetchData(word);
      setState(() {
        loaded = true;
      });
    }
  }

  fetchData(String w) async {
    var resAll =
        await http.get("https://api.datamuse.com/words?rel_jja=$w&max=20");
    dataAll = jsonDecode(resAll.body);
    print(dataAll.length);
    //loaded = true;
    setState(() {});
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
            fontSize: 40.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.blue[100],
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              //height: 500,
              child: Neumorphic(
                style: NeumorphicStyle(
                    shape: NeumorphicShape.concave,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                    depth: 5,
                    lightSource: LightSource.topLeft,
                    color: Colors.cyan[200]),
                //color: Colors.blue[500],
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: NeumorphicText(
                        "Enter an adjective to find nouns it describes",
                        style: NeumorphicStyle(
                          depth: 4, //customize depth here
                          color: Colors.cyan[700], //customize color here
                        ),
                        textStyle: NeumorphicTextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold //customize size here
                          // AND others usual text style properties (fontFamily, fontWeight, ...)
                        ),
                      ),
                      // child: Text(
                      //   "Enter a word to find similar words of it",
                      //   style: TextStyle(
                      //     fontFamily: "Signatra",
                      //     fontSize: 33.0,
                      //     color: Colors.white,
                      //   ),
                      //   textAlign: TextAlign.center,
                      // ),
                    ),
                    Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: TextFormField(
                                style: TextStyle(
                                  color: Colors.cyan[700],
                                  fontSize: 20.0,
                                ),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2.0),
                                  ),
                                  hintText: "Enter word here...",
                                  hintStyle: TextStyle(color: Colors.cyan[700]),
                                ),
                                validator: (val) => val.length == 0
                                    ? "Can't search blank input"
                                    : null,
                                onSaved: (val) => word = val,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: NeumorphicButton(
                                style: NeumorphicStyle(
                                    shape: NeumorphicShape.concave,
                                    boxShape: NeumorphicBoxShape.roundRect(
                                        BorderRadius.circular(12)),
                                    depth: 5,
                                    lightSource: LightSource.topLeft,
                                    color: Colors.cyan[300]),
                                onPressed: _submit,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "Search",
                                    style: TextStyle(
                                        fontSize: 22.0, color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                            // Padding(
                            //   padding: const EdgeInsets.all(40.0),
                            //   child: ButtonTheme(
                            //     minWidth: 120,
                            //     height: 50.0,
                            //     child: RaisedButton(
                            //       onPressed: _submit,
                            //       child: new Text(
                            //         "Search",
                            //         style: new TextStyle(
                            //           color: Colors.white,
                            //           fontSize: 20.0,
                            //         ),
                            //       ),
                            //       color: Colors.purple,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),
          loaded
              ? (dataAll != null
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: NeumorphicText(
                              "Here you go ... ",
                              style: NeumorphicStyle(
                                depth: 4, //customize depth here
                                color: Colors.cyan[700], //customize color here
                              ),
                              textStyle: NeumorphicTextStyle(
                                fontSize: 25, //customize size here
                                // AND others usual text style properties (fontFamily, fontWeight, ...)
                              ),
                            ),
                          ),
                          // Text(
                          //   "Here you go...",
                          //   style: TextStyle(
                          //     fontFamily: "Signatra",
                          //     fontSize: 40.0,
                          //     color: Colors.purple[900],
                          //   ),
                          // ),
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.only(bottom: 50.0),
                              //scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: (dataAll).length,
                              itemBuilder: (context, index) {
                                return Container(
                                  // decoration: BoxDecoration(
                                  //   border: Border(
                                  //     bottom: BorderSide(color: Colors.purple),
                                  //   ),
                                  // ),
                                  child: GestureDetector(
                                    onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Meaning(
                                                    dataAll[index]["word"]))),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15.0),
                                      child: Container(
                                        height: 50.0,
                                        child: Neumorphic(
                                          style: NeumorphicStyle(
                                              shape: NeumorphicShape.concave,
                                              boxShape:
                                                  NeumorphicBoxShape.roundRect(
                                                      BorderRadius.circular(
                                                          12)),
                                              depth: 5,
                                              lightSource: LightSource.topLeft,
                                              color: Colors.cyan[200]),
                                          //color: Colors.purple,
                                          child: Center(
                                            child: Text(
                                              dataAll[index]["word"],
                                              style: TextStyle(
                                                  color: Colors.cyan[700],
                                                  fontSize: 25.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  // child: ListTile(
                                  //   title: Text(dataAll[index]["word"]),
                                  // ),
                                );
                              }),
                        ],
                      ),
                    )
                  : Center(
                      child: SpinKitPulse(
                        color: Colors.cyan[400],
                        size: 130.0,
                      ),
                    ))
              : Padding(
                  padding: const EdgeInsets.only(top: 150.0),
                  child: Center(
                    child: NeumorphicText(
                      "Nothing Searched...",
                      style: NeumorphicStyle(
                        depth: 4, //customize depth here
                        color: Colors.cyan[800], //customize color here
                      ),
                      textStyle: NeumorphicTextStyle(
                        fontSize: 18, //customize size here
                        // AND others usual text style properties (fontFamily, fontWeight, ...)
                      ),
                      //     child: Text(
                      //   "Nothing searched...",
                      //   style: TextStyle(
                      //       fontFamily: "Signatra",
                      //       fontSize: 25.0,
                      //       color: Colors.purple),
                      // ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
