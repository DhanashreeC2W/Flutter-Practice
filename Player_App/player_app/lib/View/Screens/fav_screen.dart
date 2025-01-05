import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../Model/player_model.dart';
import './demo_screen.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  void initState() {
    super.initState();
    getFireData();
  }

  List firebaseList = [];
  void getFireData() async {
    QuerySnapshot firebasedata =
        await FirebaseFirestore.instance.collection("demo").get();
    firebaseList.clear();
    for (var value in firebasedata.docs) {
      firebaseList.add(PlayerModel(
          playerName: value['playerName'],
          jerNo: value['jerNo'],
          playerId: value.id,
          time: ""));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: firebaseList.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [GestureDetector(
                onTap:()async{
                  await FirebaseFirestore.instance.collection("demo").doc(firebaseList[index].playerId).delete();
                  firebaseList.removeAt(index);
                  setState(() {
                    
                  });
                },
                child: Text(firebaseList[index].playerName))],
            ),
          );
        },
      ),
    );
  }
}
