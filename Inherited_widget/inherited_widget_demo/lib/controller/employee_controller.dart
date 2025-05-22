import 'dart:developer';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EmployeeController extends InheritedWidget {
  final String empName;
  final int empId;
  double empSal;
  EmployeeController(
      {super.key,
      required this.empName,
      required this.empSal,
      required this.empId,
      required super.child});

  @override
  bool updateShouldNotify(EmployeeController oldWidget) {
    log("In updateShouldNotify");
    return empSal != oldWidget.empSal;
  }

  static EmployeeController of(BuildContext context) {
    log("In of");
    return context.dependOnInheritedWidgetOfExactType<EmployeeController>()!;
  }
}
