import 'package:flutter/material.dart';

class EmployeeController extends InheritedWidget {
  final String empName;
  final int empId;
  final double empSal;
  const EmployeeController(
      {super.key,
      required this.empName,
      required this.empSal,
      required this.empId,
      required super.child});

  @override
  bool updateShouldNotify(EmployeeController oldWidget) {
    return empSal != oldWidget.empSal;
  }

  static EmployeeController of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<EmployeeController>()!;
  }
}
