import 'dart:collection';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'choices.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

Future<void> calculateLevelAvg() async {
  //List<dynamic> stageScoreList = [];
  Map<String, dynamic> stageScoreMap = {};
  print("Displaying average stage score for user");
  FirebaseFirestore.instance.collection("worlds").get().then((querySnapshot) {
    querySnapshot.docs.forEach((world) {
      FirebaseFirestore.instance
          .collection("worlds")
          .doc(world.id)
          .collection("Stage")
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((stage) {
          FirebaseFirestore.instance
              .collection("worlds")
              .doc(world.id)
              .collection("Stage")
              .doc(stage.id)
              .collection("Level")
              .get()
              .then((querySnapshot) {
            querySnapshot.docs.forEach((level) {
              //stageScoreList += level['score'].values.toList();
              stageScoreMap[level.id] = level['score'];

              //stageScoreList.add(
              //(int.parse(level['score']['1lAZaWr3trMF3c2aTVqcNPF2rm12'])));
            });
            //int sum = 0;
            for (var level in stageScoreMap.keys) {
              double sum = 0;
              List<dynamic> levelScoreList =
                  stageScoreMap[level].values.toList();
              for (var i in levelScoreList) {
                sum += int.parse(i);
              }
              double levelAvg = (sum / levelScoreList.length);
              stageScoreMap[level] = sum / levelScoreList.length;
              print("Average score for " +
                  world.id +
                  " " +
                  stage.id +
                  " " +
                  level +
                  " " +
                  levelAvg.toString());

              //sum += int.parse(score);
            }

            // print("Average score for " +
            //     world.id +
            //     " " +
            //     stage.id +
            //     " " +
            //     (sum / stageScoreList.length).toString());
            //print(stageScoreList);
            print(stageScoreMap);
            //stageScoreList = [];
            stageScoreMap = {};
          });
        });
      });
    });
  });
}

Future<void> calculateStageAvg() async {
  //List<dynamic> stageScoreList = [];
  Map<String, dynamic> stageScoreMap = {};
  print("Displaying average stage score for user");
  FirebaseFirestore.instance.collection("worlds").get().then((querySnapshot) {
    querySnapshot.docs.forEach((world) {
      FirebaseFirestore.instance
          .collection("worlds")
          .doc(world.id)
          .collection("Stage")
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((stage) {
          FirebaseFirestore.instance
              .collection("worlds")
              .doc(world.id)
              .collection("Stage")
              .doc(stage.id)
              .collection("Level")
              .get()
              .then((querySnapshot) {
            Map<String, dynamic> secondMap = {};
            querySnapshot.docs.forEach((level) {
              //stageScoreList += level['score'].values.toList();
              stageScoreMap[level.id] = level['score'];

              //stageScoreList.add(
              //(int.parse(level['score']['1lAZaWr3trMF3c2aTVqcNPF2rm12'])));
            });
            //int sum = 0;
            double stageSum = 0;
            double stageCounter = 0;
            for (var level in stageScoreMap.keys) {
              double sum = 0;
              List<dynamic> levelScoreList =
                  stageScoreMap[level].values.toList();
              for (var i in levelScoreList) {
                sum += int.parse(i);
              }
              double levelAvg = (sum / levelScoreList.length);
              stageScoreMap[level] = sum / levelScoreList.length;
              print("Average score for " +
                  world.id +
                  " " +
                  stage.id +
                  " " +
                  levelAvg.toString());
              stageCounter += 1;
              stageSum += levelAvg;
              //sum += int.parse(score);
            }
            double stageAvg = stageSum / stageCounter;
            secondMap[stage.id] = stageAvg;

            // print("Average score for " +
            //     world.id +
            //     " " +
            //     stage.id +
            //     " " +
            //     (sum / stageScoreList.length).toString());
            //print(stageScoreList);
            //print(stageScoreMap);
            print(world.id + " " + secondMap.toString());
            //stageScoreList = [];
            stageScoreMap = {};
            secondMap = {};
          });
        });
      });
    });
  });
}

Future<void> calculateWorldAvg() async {
  //List<dynamic> stageScoreList = [];
  Map<String, dynamic> stageScoreMap = {};
  Map<String, dynamic> worldScoreMap = {};
  print("Displaying average stage score for user");
  FirebaseFirestore.instance.collection("worlds").get().then((querySnapshot) {
    querySnapshot.docs.forEach((world) {
      FirebaseFirestore.instance
          .collection("worlds")
          .doc(world.id)
          .collection("Stage")
          .get()
          .then((querySnapshot) {
        Map<String, dynamic> thirdMap = {};
        querySnapshot.docs.forEach((stage) {
          FirebaseFirestore.instance
              .collection("worlds")
              .doc(world.id)
              .collection("Stage")
              .doc(stage.id)
              .collection("Level")
              .get()
              .then((querySnapshot) {
            Map<String, dynamic> secondMap = {};
            querySnapshot.docs.forEach((level) {
              //stageScoreList += level['score'].values.toList();
              stageScoreMap[level.id] = level['score'];

              //stageScoreList.add(
              //(int.parse(level['score']['1lAZaWr3trMF3c2aTVqcNPF2rm12'])));
            });
            //int sum = 0;
            double stageSum = 0;
            double stageCounter = 0;
            for (var level in stageScoreMap.keys) {
              double sum = 0;
              List<dynamic> levelScoreList =
                  stageScoreMap[level].values.toList();
              for (var i in levelScoreList) {
                sum += int.parse(i);
              }
              double levelAvg = (sum / levelScoreList.length);
              stageScoreMap[level] = sum / levelScoreList.length;
              // print("Average score for " +
              //     world.id +
              //     " " +
              //     stage.id +
              //     " " +
              //     levelAvg.toString());
              stageCounter += 1;
              stageSum += levelAvg;
              //sum += int.parse(score);
            }

            double stageAvg = stageSum / stageCounter;
            secondMap[stage.id] = stageAvg;

            // print("Average score for " +
            //     world.id +
            //     " " +
            //     stage.id +
            //     " " +
            //     (sum / stageScoreList.length).toString());
            //print(stageScoreList);
            //print(stageScoreMap);
            //print(world.id + " " + secondMap.toString());

            worldSum += secondMap.values.toList()[0];
            worldCounter += 1;
            print(worldCounter);
            print(worldSum);
            //stageScoreList = [];
            stageScoreMap = {};
            secondMap = {};
          });
          double worldAvg = worldSum / worldCounter;
          thirdMap[world.id] = worldAvg;
          print(world.id + "hello" + thirdMap.toString());
          thirdMap = {};
        });
      });
    });
  });
}

Future<void> testList() async {
  List<int> sampleList = [1, 2, 6, 7, 9];
  sampleList.remove(sampleList.reduce(max));
  print(sampleList.reduce(max));
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
              image: AssetImage('assets/homepage.png'),
              fit: BoxFit.fill,
            ))),

            ///Play Button
            Container(
                width: 346.0,
                height: 407.0,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(66, 320, 2, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, '/choices');
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(150, 0, 0, 0),
                        child: _titleContainer('Play'),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.grey),
                    ))),

            ///Leaderboards Button
            Container(
                width: 347.0,
                height: 540.0,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(68, 453, 2, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        calculateWorldAvg();
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                        child: _titleContainer('Leaderboards'),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.grey),
                    ))),

            ///Settings Button
            Container(
                width: 347.0,
                height: 670.0,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(67, 587, 2, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => SettingsPage()),
                        // );
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                        child: _titleContainer('Settings'),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.grey),
                    ))),
          ],
        ));
  }
}

Widget _titleContainer(String myTitle) {
  return Text(
    myTitle,
    style: TextStyle(
        color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
  );
}
