import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/database.dart';
import 'package:flutter_application_1/model.dart';

class PersonDetailsScreen extends StatefulWidget {
  const PersonDetailsScreen({super.key});

  @override
  State<PersonDetailsScreen> createState() => _PersonDetailsScreenState();
}

class _PersonDetailsScreenState extends State<PersonDetailsScreen> {
  @override
  void initState() {
    super.initState();
    createTable();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController eduController = TextEditingController();

  List<Model> allCardList = [];

  Future addCard() async {
    List<Model> data = await getData();
    allCardList = data;
    setState(() {});
    log("In addCArd()");
    log("---------------- $allCardList-------------------");
    log("End of addCard()");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1000,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///TEXTFEILD 1 : PERSON NAME
              SizedBox(
                width: 200,
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    label: Text("Person Name"),
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),

              ///TEXTFEILD 2 : PERSON AGE
              SizedBox(
                width: 200,
                child: TextField(
                  controller: ageController,
                  decoration: const InputDecoration(
                    label: Text("Person Age"),
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),

              ///TEXTFEILD 3 : PERSON EDUCATION
              SizedBox(
                width: 200,
                child: TextField(
                  controller: eduController,
                  decoration: const InputDecoration(
                    label: Text("Person Education"),
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),

              ///SUBMIT BUTTON
              GestureDetector(
                onTap: () async {
                  //clearTable();
                  final agetext = ageController.text;
                  int age = int.parse(agetext);
                  log("Button pressed");

                  log("data inserted");

                  insertData(Model(
                      perName: nameController.text,
                      perAge: age,
                      perEducation: eduController.text));
                  // }//////

                  //  }
                  await addCard();
                  log("Data added in Add CArd");
                  setState(() {});
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 70,
                  color: const Color.fromARGB(255, 147, 225, 235),
                  child: const Text("Submit"),
                ),
              ),
              const Divider(height: 0),

              ///TO DISPLAY PERSON DETAILS AFTER SUBMIT
              SizedBox(
                //color: Colors.amber,
                height: MediaQuery.of(context).size.height / 1.9,
                child: ListView.builder(
                  itemCount: allCardList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 171, 208, 236),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Text(
                              "Person Name : ${allCardList[index].perName}"),
                          Text("Person Age : ${allCardList[index].perAge}"),
                          Text(
                              "Person Education : ${allCardList[index].perEducation}"),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
