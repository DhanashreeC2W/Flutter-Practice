import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:SvgPicture.asset("assest/pngwing.svg"),
    );
  }
}