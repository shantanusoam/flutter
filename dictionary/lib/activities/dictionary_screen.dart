import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:dictionary/activities/meaning.dart';

class Dictionary extends StatefulWidget {
  @override
  _DictionaryState createState() => _DictionaryState();
}

class _DictionaryState extends State<Dictionary> {
  final formKey = new GlobalKey<FormState>();
  String word;
  var dataAll;

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => Meaning(word),
        ),
      );
      //fetchData(word);
      // setState(() {
      //   loaded = true;
      // });
    }
  }

  // fetchData(String w) async {
  //   var resAll = await http.get("https://api.datamuse.com/words?ml=$w&max=20");
  //   dataAll = jsonDecode(resAll.body);
  //   print(dataAll.length);
  //   //loaded = true;
  //   setState(() {});
  // }

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
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.blue[100],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: SingleChildScrollView(
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
                      "Enter a word to find stuff related to it",
                      style: NeumorphicStyle(
                        depth: 4, //customize depth here
                        color: Colors.cyan[700], //customize color here
                      ),
                      textStyle: NeumorphicTextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold, //customize size here
                        // AND others usual text style properties (fontFamily, fontWeight, ...)
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
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2.0),
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
