import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class ConfettiAnimationWidget extends StatefulWidget {
  const ConfettiAnimationWidget({super.key});

  @override
  State<ConfettiAnimationWidget> createState() =>
      _ConfettiAnimationWidgetState();
}

class _ConfettiAnimationWidgetState extends State<ConfettiAnimationWidget> {
  ConfettiController _controller = ConfettiController();

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: const Duration(seconds: 10));
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Top Left
        Align(
          alignment: Alignment.topLeft,
          child: ConfettiWidget(
            confettiController: _controller,
            blastDirection: 0, // Blast towards right
            emissionFrequency: 0.05,
            numberOfParticles: 10,
            maxBlastForce: 10,
            minBlastForce: 2,
            gravity: 0.1,
            colors: const [
              Colors.red,
              Colors.blue,
              Colors.green,
              Colors.yellow
            ],
          ),
        ),

        // Top Right
        Align(
          alignment: Alignment.topRight,
          child: ConfettiWidget(
            confettiController: _controller,
            blastDirection: 3.14, // Blast towards left
            emissionFrequency: 0.05,
            numberOfParticles: 10,
            maxBlastForce: 10,
            minBlastForce: 2,
            gravity: 0.1,
            colors: const [
              Colors.purple,
              Colors.orange,
              Colors.pink,
              Colors.teal
            ],
          ),
        ),

        // Bottom Center
        Align(
          alignment: Alignment.bottomCenter,
          child: ConfettiWidget(
            confettiController: _controller,
            blastDirection: -1.57, // Blast upwards
            emissionFrequency: 0.05,
            numberOfParticles: 10,
            maxBlastForce: 10,
            minBlastForce: 2,
            gravity: 0.1,
            colors: const [
              Colors.amber,
              Colors.cyan,
              Colors.indigo,
              Colors.lime
            ],
          ),
        ),
      ],
    );
  }
}
