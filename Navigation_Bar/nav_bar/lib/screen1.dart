import 'package:flutter/material.dart';
import 'package:nav_bar/navbar.dart';
import 'package:nav_bar/screen2.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // bottomNavigationBar: Navbar(),
      body: Center(
        child: GestureDetector
        
        (
          onTap: (){
            Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context){
              return Screen2();
            }));
          },
          child: const Text('SCREEN 1')),
      ),
    );
  }
}
