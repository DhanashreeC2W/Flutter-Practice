import 'package:flutter/material.dart';
import 'package:inherited_widget_demo/controller/employee_controller.dart';

class EmployeeScreen1 extends StatefulWidget {
  const EmployeeScreen1({super.key});

  @override
  State<EmployeeScreen1> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen1> {
  @override
  Widget build(BuildContext lontext) {
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
            Text("Employee Salary : ${EmployeeController.of(context).empSal}"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
         EmployeeController.of(context).empSal = 30.9;
         setState(() {
           
         });
          // Navigator.of(context).push(MaterialPageRoute(builder: (context){
          //   return const EmployeeScreen2(empSal: 50.5);
            
          // }));
        
      }),
    );

  }
}
