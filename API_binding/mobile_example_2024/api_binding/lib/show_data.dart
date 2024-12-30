import 'dart:developer';

import 'package:flutter/material.dart';

class ShowData extends StatelessWidget {
  final dynamic data;
  const ShowData({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    log("$data");
    return  Scaffold(
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context,index){
        return Column(
          children: [
            Text(data["name"])
          ],
        );
      },),
    );
  }
}