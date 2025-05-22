import 'package:flutter/material.dart';

class CompanyContoller extends InheritedWidget {
  String cmpName;
  int empCount;
  String loc;
  // ignore: use_super_parameters
  CompanyContoller({
    super.key,
    required this.cmpName,
    required this.empCount,
    required this.loc,
    required Widget child,
  }) : super(child: child);

  @override  
  bool updateShouldNotify(CompanyContoller oldWidget) {
    return true;
  }
}


