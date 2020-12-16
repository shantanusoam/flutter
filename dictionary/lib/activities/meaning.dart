import 'dart:convert';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Meaning extends StatefulWidget {
  Meaning(this.word);
  final String word;

  @override
  _MeaningState createState() => _MeaningState();
}

class _MeaningState extends State<Meaning> {
  var data;
  bool found = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http
        .get("https://api.dictionaryapi.dev/api/v2/entries/en/${widget.word}");
    data = jsonDecode(res.body);
    print(data);
    try {
      var x = data[0]['word'];
      x = data[0]['meanings'][0]['partOfSpeech'];
      x = data[0]['meanings'][0]['definitions'][0]['definition'];
      x = data[0]['meanings'][0]['definitions'][0]['example'];
      print(x);
    } catch (e) {
      print(e);
      found = false;
    }
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
      backgroundColor: Colors.cyan[100],
      body: data == null
          ? Center(
              child: SpinKitPulse(
                color: Colors.cyan[400],
                size: 130.0,
              ),
            )
          : !found
              ? Center(
                  child: Neumorphic(
                    style: NeumorphicStyle(
                        shape: NeumorphicShape.flat,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(12)),
                        depth: -5,
                        lightSource: LightSource.topLeft,
                        color: Colors.cyan[300]),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Neumorphic(
                        style: NeumorphicStyle(
                            shape: NeumorphicShape.flat,
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(12)),
                            depth: 5,
                            lightSource: LightSource.topLeft,
                            color: Colors.cyan[200]),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Sorry can't find anything",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.cyan[800],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : (Center(
                  child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Neumorphic(
                      style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(12)),
                          depth: 5,
                          lightSource: LightSource.topLeft,
                          color: Colors.cyan[200]),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 5.0, right: 5.0, bottom: 20.0),
                              child: Neumorphic(
                                style: NeumorphicStyle(
                                    shape: NeumorphicShape.flat,
                                    boxShape: NeumorphicBoxShape.roundRect(
                                        BorderRadius.circular(12)),
                                    depth: 5,
                                    lightSource: LightSource.topLeft,
                                    color: Colors.cyan[200]),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          "Word: ",
                                          style: TextStyle(fontSize: 15.0),
                                        ),
                                      ),
                                      Expanded(
                                        child: Neumorphic(
                                          style: NeumorphicStyle(
                                              shape: NeumorphicShape.flat,
                                              boxShape:
                                                  NeumorphicBoxShape.roundRect(
                                                      BorderRadius.circular(
                                                          12)),
                                              depth: -5,
                                              lightSource: LightSource.topLeft,
                                              color: Colors.cyan[400]),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Text(
                                              "${data[0]['word']}",
                                              style: TextStyle(
                                                fontSize: 24.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Neumorphic(
                              style: NeumorphicStyle(
                                  shape: NeumorphicShape.flat,
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(12)),
                                  depth: 5,
                                  lightSource: LightSource.topLeft,
                                  color: Colors.cyan[200]),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            "Part of \nSpeech: ",
                                            style: TextStyle(fontSize: 14.0),
                                          ),
                                        ),
                                        Expanded(
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
                                                color: Colors.cyan[400]),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Text(
                                                "${data[0]['meanings'][0]['partOfSpeech']}",
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    color: Colors.white),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Neumorphic(
                                      style: NeumorphicStyle(
                                          shape: NeumorphicShape.flat,
                                          boxShape:
                                              NeumorphicBoxShape.roundRect(
                                                  BorderRadius.circular(12)),
                                          depth: -5,
                                          lightSource: LightSource.topLeft,
                                          color: Colors.cyan[300]),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 30.0, right: 30.0, left: 30.0),
                                        child: ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            //padding: const EdgeInsets.only(bottom: 50.0),
                                            //scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            itemCount: (data[0]['meanings'][0]
                                                    ['definitions'])
                                                .length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 40.0),
                                                child: Container(
                                                  child: Neumorphic(
                                                    style: NeumorphicStyle(
                                                        shape: NeumorphicShape
                                                            .flat,
                                                        boxShape:
                                                            NeumorphicBoxShape
                                                                .roundRect(
                                                                    BorderRadius
                                                                        .circular(
                                                                            12)),
                                                        depth: 5,
                                                        lightSource:
                                                            LightSource.topLeft,
                                                        color:
                                                            Colors.cyan[200]),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              14.0),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            "Definition: \n${data[0]['meanings'][0]['definitions'][index]['definition']}",
                                                            style: TextStyle(
                                                              fontSize: 18.0,
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      bottom:
                                                                          10.0)),
                                                          Text(
                                                            "Ex: ${data[0]['meanings'][0]['definitions'][index]['example']}",
                                                            style: TextStyle(
                                                              fontSize: 15.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
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
                )
                  // Card(
                  //   color: Colors.purple,
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(20.0),
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         Text(
                  //           data[0]["word"],
                  //           style: TextStyle(
                  //             fontFamily: "Signatra",
                  //             fontSize: 40.0,
                  //             color: Colors.white,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  )),
    );
  }
}
