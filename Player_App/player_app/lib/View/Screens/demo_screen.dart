import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/Model/player_model.dart';
import 'package:firebase_demo/View/Screens/fav_screen.dart';
import 'package:flutter/material.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  List<PlayerModel> playerList = [
    PlayerModel(
        playerName: "MSD", jerNo: "7", playerId: "1", time: DateTime.now()),
    PlayerModel(
        playerName: "dd", jerNo: "24", playerId: "2", time: DateTime.now())
  ];
  List firebaseList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: playerList.length,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: [
                    Text(playerList[index].playerName),
                    Text(playerList[index].jerNo),
                    GestureDetector(
                        child: GestureDetector(
                            onTap: () async {
                              Map<String, dynamic> data = {};
                              for (int i = 0; i < playerList.length; i++) {
                                data = {
                                  "playerName": playerList[index].playerName,
                                  "jerNo": playerList[index].jerNo,
                                };
                                FirebaseFirestore.instance
                                    .collection("demo")
                                    .add(data);
                              }

                            
                            
                              setState(() {});
                            },
                            child: const Text("Add to favourite"))),
                  ],
                ),
              );
            }));
  }
}
