import 'package:flutter/material.dart';
import 'package:text_animation/View/Widgets/text_animation_widget.dart';

class TextAnimation extends StatefulWidget {
  const TextAnimation({super.key});

  @override
  State<TextAnimation> createState() => _TextAnimationState();
}

class _TextAnimationState extends State<TextAnimation> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextAnimationWidget(animationText: "HAPPY NEW YEAR"),
            const SizedBox(height: 70,),
            Image.network("https://media0.giphy.com/media/0n8j4zs6xhA6HuxDmQ/giphy.gif?cid=6c09b952mf9hcbmqgayns7pt3p98akea9w0sjek9i2cq86hf&ep=v1_gifs_search&rid=giphy.gif&ct=g",height: 140,)
          ],
        ),
      ),
    );
  }
}
