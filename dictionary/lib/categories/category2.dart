import 'dart:convert';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:dictionary/activities/meaning.dart';

class Category2 extends StatefulWidget {
  @override
  _Category2State createState() => _Category2State();
}

class _Category2State extends State<Category2> {
  final formKey = new GlobalKey<FormState>();
  bool loaded = false;
  String word, letter;
  var dataAll;

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      fetchData(word, letter);
      setState(() {
        loaded = true;
      });
    }
  }

  fetchData(String w, String l) async {
    var resAll =
        await http.get("https://api.datamuse.com/words?ml=$w&sp=$l*&max=10");
    dataAll = jsonDecode(resAll.body);
    print(dataAll.length);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              child: Neumorphic(
                style: NeumorphicStyle(
                    shape: NeumorphicShape.concave,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                    depth: 5,
                    lightSource: LightSource.topLeft,
                    color: Colors.cyan[200]),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: NeumorphicText(
                        "Enter a word to find some related words starting with some letters/letter",
                        style: NeumorphicStyle(
                          depth: 4, //customize depth here
                          color: Colors.cyan[700], //customize color here
                        ),
                        textStyle: NeumorphicTextStyle(
                          fontSize: 25, //customize size here
                        ),
                      ),
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
                                  hintText: "Enter letters here...",
                                  hintStyle: TextStyle(color: Colors.cyan[700]),
                                ),
                                validator: (val) => val.length == 0
                                    ? "Can't search blank input"
                                    : null,
                                onSaved: (val) => letter = val,
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
                              ),
                            ),
                          ),
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.only(bottom: 50.0),
                              //scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: dataAll.length,
                              itemBuilder: (context, index) {
                                return Container(
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
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
