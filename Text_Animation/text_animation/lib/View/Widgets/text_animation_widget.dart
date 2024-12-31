import 'dart:developer';

import 'package:flutter/material.dart';

class TextAnimationWidget extends StatefulWidget {
  final String animationText;
  const TextAnimationWidget({super.key, required this.animationText});

  @override
  State<TextAnimationWidget> createState() => _TextAnimationWidgetState();
}

class _TextAnimationWidgetState extends State<TextAnimationWidget> {
  int? selectedIndex;
  int? left;
  int? right;

  final List<GlobalKey> _lettersKey = [];
  @override
  void initState() {
    super.initState();

    _lettersKey
        .addAll(List.generate(widget.animationText.length, (_) => GlobalKey()));
  }

  void _updatePosition(Offset position) {
    for (int i = 0; i < _lettersKey.length; i++) {
      log("in for loop");
      final key = _lettersKey[i];
      final renderBox = key.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox == null) continue;
      final boxPosi = renderBox.localToGlobal(Offset.zero);
      final boxSize = renderBox.size;
      if (position.dx >= boxPosi.dx &&
          position.dx <= boxPosi.dx + boxSize.width) {
        setState(() {
          log("in setstate");
          selectedIndex = i;
          left = i - 1;
          right = i + 1;
        });
        break;
      }
    }
  }

  double _getTextFontSize(int index) {
    log("In fontSize");
    if (selectedIndex == index) {
      return 80;
    } else if (left == index || right == index) {
      return 50;
    } else {
      return 50;
    }
  }

  Color _getTextColor(int index) {
    log("In Color");
    if (selectedIndex == index) {
      return Colors.orange;
    } else if (left == index || right == index) {
      return const Color.fromARGB(255, 229, 194, 142);
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textData = widget.animationText.split('');
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        _updatePosition(details.globalPosition);
      },
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(textData.length, (index) {
            return TweenAnimationBuilder<double>(
              key: _lettersKey[index],
                tween: Tween(begin: 30, end: _getTextFontSize(index)),
                duration: const Duration(milliseconds: 100),
                builder: (context, size, child) {
                  return Text(
                    textData[index],
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: size,
                        color: _getTextColor(index)),
                  );
                });
          })),
    );
  }
}
