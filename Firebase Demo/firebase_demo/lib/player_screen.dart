import 'package:firebase_demo/demo.dart';
import 'package:flutter/material.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.of( context)
            .pushReplacement(MaterialPageRoute(builder: (context) =>const  Demo())));

    return Scaffold(
      body: Column(
        children: [
          Image.network(
              height: 200,
              width: 200,
              "https://cdn.shopify.com/app-store/listing_images/a78e004f44cded1b6998e7a6e081a230/icon/COng2Lf0lu8CEAE=.png"),
        ],
      ),
    );
  }
}
