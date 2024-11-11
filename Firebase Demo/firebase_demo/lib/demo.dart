import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/player_model.dart';
import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jersyController = TextEditingController();
  List<PlayerModel> playerDataList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 900,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    hintText: "Enter Player Name",
                    labelText: "Player Name",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(
                              255, 79, 158, 232)), // Visible color
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              Color.fromARGB(255, 33, 34, 35)), // Visible color
                    ),
                    fillColor: Color.fromARGB(255, 234, 196, 237),
                    filled: true),
              ),
            ),
            SizedBox(
                width: 300,
                child: TextField(
                  controller: jersyController,
                  decoration: const InputDecoration(
                      hintText: "Enter Jersy Number",
                      labelText: "Jersy Number",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(
                                255, 114, 160, 217)), // Visible color
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(
                                255, 50, 51, 52)), // Visible color
                      ),
                      fillColor: Color.fromARGB(255, 230, 200, 236),
                      filled: true),
                )),
            GestureDetector(
              onTap: () {
                if (nameController.text.trim().isNotEmpty &&
                    jersyController.text.trim().isNotEmpty) {
                  Map<String, dynamic> data = {
                    "playerName": nameController.text,
                    "jerNo": jersyController.text,
                  };
                  FirebaseFirestore.instance.collection('player').add(data);
                  nameController.clear();
                  jersyController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Data Added")));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Invalid Data")));
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
                QuerySnapshot response =
                    await FirebaseFirestore.instance.collection('player').get();
                playerDataList.clear();
                for (int i = 0; i < response.docs.length; i++) {
                  print("${response.docs[i]['playerName']}");

                  playerDataList.add(PlayerModel(
                      playerName: response.docs[i]['playerName'],
                      jerNo:int.parse( response.docs[i]['jerNo'],),
                      playerId: int.parse(response.docs[i].id)));
                }
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
            SizedBox(
              height: 500,
              child: ListView.builder(
                  itemCount: playerDataList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 50,
                      width: 150,
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.grey,
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
            )
          ],
        ),
      ),
    );
  }
}
