import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';


void main(){
  runApp(StudentDetails());
}

class StudentDetails extends StatefulWidget {
  const StudentDetails({super.key});

  @override
  State createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  SingleValueDropDownController classController = SingleValueDropDownController();
  SingleValueDropDownController departmentController = SingleValueDropDownController();
  TextEditingController rollNoController = TextEditingController();
  
  void asch(){


  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Scaffold(
        appBar: AppBar(
          title: Text(
             "${firstNameController.text}",
            style: GoogleFonts.italiana(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: const Color.fromRGBO(255, 255, 255, 1),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text(
                    "${firstNameController.text}",
                    style: GoogleFonts.quicksand(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      //color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 5),
                  SizedBox(
                    height: 50,
                    width: 220,
                    child: TextField(
                      controller: firstNameController,
                      style: GoogleFonts.quicksand(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                      decoration: const InputDecoration(
                        fillColor: Colors.black,
                        hintText: "Enter First Name",
                        hintStyle: TextStyle(
                          fontSize: 22,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Middle Name : ",
                    style: GoogleFonts.quicksand(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      //color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 5),
                  SizedBox(
                    height: 50,
                    width: 220,
                    child: TextField(
                      controller: middleNameController,
                      style: GoogleFonts.quicksand(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                      decoration: const InputDecoration(
                        fillColor: Colors.black,
                        hintText: "Enter Middle Name",
                        hintStyle: TextStyle(
                          fontSize: 22,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Last Name : ",
                    style: GoogleFonts.quicksand(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      //color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 5),
                  SizedBox(
                    height: 50,
                    width: 220,
                    child: TextField(
                      controller: lastNameController,
                      style: GoogleFonts.quicksand(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                      decoration: const InputDecoration(
                        fillColor: Colors.black,
                        hintText: "Enter Last Name",
                        hintStyle: TextStyle(
                          fontSize: 22,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Roll No : ",
                    style: GoogleFonts.quicksand(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      //color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 5),
                  SizedBox(
                    height: 50,
                    width: 220,
                    child: TextField(
                      controller: rollNoController,
                      style: GoogleFonts.quicksand(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                      decoration: const InputDecoration(
                        fillColor: Colors.black,
                        hintText: "Enter Roll No",
                        hintStyle: TextStyle(
                          fontSize: 22,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Class : ",
                    style: GoogleFonts.quicksand(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      //color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    height: 50,
                    width: 220,
                    child: DropDownTextField(
                      controller: classController,
                      clearOption: true,
                      enableSearch: true,
                      searchTextStyle: const TextStyle(color: Colors.black),
                      searchDecoration: const InputDecoration(
                        hintText: "Search class",
                      ),
                      validator: (value) {
                        if (value == null) {
                          return "Required field";
                        } else {
                          return null;
                        }
                      },
                      dropDownItemCount: 4,
                      
                      dropDownList: const [
                        DropDownValueModel(name: 'FE', value: 'FE'),
                        DropDownValueModel(name: 'SE', value: 'SE'),
                        DropDownValueModel(name: 'TE', value: 'TE'),
                        DropDownValueModel(name: 'BE', value: 'BE'),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Department : ",
                    style: GoogleFonts.quicksand(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      //color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    height: 50,
                    width: 220,
                    child: DropDownTextField(
                      controller: departmentController,
                      clearOption: true,
                      enableSearch: true,
                      searchTextStyle: const TextStyle(color: Colors.black),
                      searchDecoration: const InputDecoration(
                        hintText: "Search Department",
                      ),
                      validator: (value) {
                        if (value == null) {
                          return "Required field";
                        } else {
                          return null;
                        }
                      },
                      dropDownItemCount: 5,
                      dropDownList: const [
                        DropDownValueModel(name: 'Mechanical', value: 'FE'),
                        DropDownValueModel(name: 'Electrical', value: 'SE'),
                        DropDownValueModel(name: 'Electronics', value: 'TE'),
                        DropDownValueModel(name: 'Computer', value: 'BE'),
                        DropDownValueModel(name: 'IT', value: 'BE'),
                      ],
                    ),
                  ),
                ],
              ),
      
              Center(
                child: GestureDetector(
                  onTap: (){
                    print("${departmentController.dropDownValue}");
                  },
                  child: Container(
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color : Colors.black,
                        width : 2,
                      ),
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "Submit",
                        style: GoogleFonts.quicksand(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}