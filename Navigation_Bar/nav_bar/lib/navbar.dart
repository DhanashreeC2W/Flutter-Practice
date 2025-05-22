import 'package:flutter/material.dart';
import 'package:nav_bar/screen1.dart';
import 'package:nav_bar/screen2.dart';
import 'package:nav_bar/screen3.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  static int _selectedScreenIndex = 0;
  List<Widget> allScreensList = [
    const Screen1(),
    const Screen2(),
    const Screen3(),
  ];

  void _onTapScreen(int index) {
    _selectedScreenIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: allScreensList.elementAt(_selectedScreenIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "")
          ],
          unselectedItemColor: Colors.purple,
          // showSelectedLabels: true,
          // unselectedFontSize: 10,
          // selectedFontSize: 20,
          selectedItemColor: Colors.amber,
          landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
          // useLegacyColorScheme: true,
          currentIndex: _selectedScreenIndex,

          onTap: _onTapScreen,
        ));
  }
}