import 'dart:developer';

import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    log("In TODOScreen Build");
    return Scaffold(
      body: ListView.builder(itemBuilder: (context, index) {
        return myCard();
      }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        openBottonSheet();
      }),
    );
  }

  Widget myCard() {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(20),
    );
  }

  openBottonSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (index) {
          return Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                TextFormField(smartDashesType: SmartDashesType.disabled,)
              ],
            ),
          );
        });
  }
}
