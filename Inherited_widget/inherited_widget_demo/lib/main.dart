import 'package:flutter/material.dart';
import 'package:inherited_widget_demo/controller/employee_controller.dart';
import 'view/Employee Example/employee_screen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final String empName = "Dhanashree";
  final int empId = 250;
  final double empSal = 2.4;
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return EmployeeController(
      empName: empName,
      empId: empId,
      empSal: empSal,
      child: const MaterialApp(
        home: EmployeeScreen1(),
      ),
    );
  }
}
