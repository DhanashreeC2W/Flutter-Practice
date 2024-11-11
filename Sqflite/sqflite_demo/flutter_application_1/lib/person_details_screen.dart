import 'package:flutter/material.dart';
import 'package:flutter_application_1/database.dart';
import 'package:flutter_application_1/model.dart';

class PersonDetailsScreen extends StatefulWidget {
  const PersonDetailsScreen({super.key});

  @override
  State<PersonDetailsScreen> createState() => _PersonDetailsScreenState();
}

class _PersonDetailsScreenState extends State<PersonDetailsScreen> {
  void initState() {
    super.initState();
    createTable();
  }
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController eduController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///TEXTFEILD 1 : PERSON NAME
             SizedBox(
              width: 200,
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  label: Text("Person Name"),
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
            ),

            ///TEXTFEILD 2 : PERSON AGE
            const SizedBox(
              width: 200,
              child: TextField(
                decoration: InputDecoration(
                  label: Text("Person Age"),
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
            ),

            ///TEXTFEILD 3 : PERSON EDUCATION
            const SizedBox(
              width: 200,
              child: TextField(
                decoration: InputDecoration(
                  label: Text("Person Education"),
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
            ),

            ///SUBMIT BUTTON
            GestureDetector(
              onTap: () async{
                final agetext = ageController.text;
                int age = int.parse(agetext);
                print("Button pressed");
                // if (nameController.text.isNotEmpty &&
                //     ageController.text.isNotEmpty &&
                //     eduController.text.isNotEmpty) {
                // if(age!=null) {
                print("data inserted");

                  insertData(Model(
                      personName: nameController.text,
                      personAge:age,
                      personEducation: eduController.text));
                // }//////

                //  }
                print(await getData()) ;
              
              },
              child: Container(
                alignment: Alignment.center,
                height: 30,
                width: 70,
                color: Colors.cyan,
                child: const Text("Submit"),
              ),
            ),

            ///TO DISPLAY PERSON DETAILS AFTER SUBMIT
            SizedBox(
              height: 500,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(20),
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    child: const Column(
                      children: [
                        
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
