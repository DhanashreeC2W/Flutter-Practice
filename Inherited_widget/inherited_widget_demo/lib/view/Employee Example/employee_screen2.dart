import 'package:flutter/material.dart';

import '../../controller/employee_controller.dart';

class EmployeeScreen2 extends StatefulWidget {
  final double empSal;
  const EmployeeScreen2({super.key,required this.empSal});

  @override
  State<EmployeeScreen2> createState() => _EmployeeScreen2State();
}

class _EmployeeScreen2State extends State<EmployeeScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Employees Data"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Employee Name : ${EmployeeController.of(context).empName}"),
              const SizedBox(
                height: 20,
              ),
              Text("Employee Id : ${EmployeeController.of(context).empId}"),
              const SizedBox(
                height: 20,
              ),
              Text(
                  "Employee Salary : ${EmployeeController.of(context).empSal}"),
            ],
          ),
        ));
  }
}
