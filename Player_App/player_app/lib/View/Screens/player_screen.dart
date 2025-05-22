import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/Model/player_model.dart';
import 'package:firebase_demo/View/Screens/login_screen.dart';
import 'package:firebase_demo/View/Widgets/snackbar_widget.dart';
import 'package:flutter/material.dart';

class PlayerScreen extends StatefulWidget {
  final String email;
  const PlayerScreen({super.key, required this.email});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jersyController = TextEditingController();
  List<PlayerModel> playerDataList = [];
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 234, 227, 206),
        title: Text("${_firebaseAuth.currentUser!.email}"),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              _firebaseAuth.signOut();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) {
                  return const LoginScreen();
                }),
                (route) => false,
              );
            },
            child: const Icon(
              Icons.logout,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ///TEXTFEILD 1 : PLAYER NAME
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: nameController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: "Enter Player Name",
                        labelText: "Player Name",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 79, 158, 232)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 33, 34, 35)),
                        ),
                        fillColor: Color.fromARGB(255, 234, 196, 237),
                        filled: true),
                  ),
                ),

                ///TEXTFEILD 2 : JERSEY NUMBER
                SizedBox(
                    width: 300,
                    child: TextField(
                      controller: jersyController,
                      decoration: const InputDecoration(
                          hintText: "Enter Jersy Number",
                          labelText: "Jersy Number",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 114, 160, 217)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 50, 51, 52)),
                          ),
                          fillColor: Color.fromARGB(255, 230, 200, 236),
                          filled: true),
                    )),

                ///SUBMIT BUTTON

                GestureDetector(
                  onTap: () {
                    if (nameController.text.trim().isNotEmpty &&
                        jersyController.text.trim().isNotEmpty) {
                      Map<String, dynamic> data = {
                        "playerName": nameController.text,
                        "jerNo": jersyController.text,
                        "time": DateTime.now(),
                      };

                      FirebaseFirestore.instance.collection('player').add(data);
                      nameController.clear();
                      jersyController.clear();
                      SnackbarWidget.showSnackBar(
                          context, "Data Added Successfully");
                    } else {
                      SnackbarWidget.showSnackBar(context, "INVALID DATA");
                    }
                  },
                  child: Container(
                    height: 30,
                    width: 70,
                    alignment: Alignment.center,
                    color: Colors.grey,
                    child: const Text("Submit"),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    QuerySnapshot response = await FirebaseFirestore.instance
                        .collection('player')
                        .orderBy("time")
                        .get();
                    playerDataList.clear();
                    for (var value in response.docs) {
                      print("${value['playerName']}");
                      print("${value['jerNo']}");
                      print("${value['time']}");

                      playerDataList.add(PlayerModel(
                          playerName: value["playerName"],
                          jerNo: value['jerNo'],
                          playerId: value.id,
                          time: value['time']));
                    }
                    print("-----------------------------------");
                    setState(() {});
                  },
                  child: Container(
                    height: 30,
                    width: 70,
                    alignment: Alignment.center,
                    color: Colors.grey,
                    child: const Text("Get data"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 500,
              child: ListView.builder(
                  itemCount: playerDataList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 50,
                      width: 150,
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 228, 237, 174),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                              "Player Name : ${playerDataList[index].playerName}"),
                          Text(
                            "Jersey Number : ${playerDataList[index].jerNo}",
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
