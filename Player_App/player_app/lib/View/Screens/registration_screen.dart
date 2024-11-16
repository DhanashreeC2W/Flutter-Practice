import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/View/Widgets/snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showPassword = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "REGISTER",
              style: GoogleFonts.arbutus(fontSize: 24),
            ),

            ///TEXTFEILD 1 : EMAIL
            SizedBox(
              width: 300,
              child: TextField(
                controller: _emailController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: "Enter Email ",
                    labelText: "Email",
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 79, 158, 232)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 33, 34, 35)),
                    ),
                    fillColor: Color.fromARGB(255, 199, 226, 238),
                    filled: true),
              ),
            ),

            ///TEXTFEILD 2 : PASSWORD
            SizedBox(
              width: 300,
              child: TextField(
                controller: _passwordController,
                obscureText: !showPassword,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                        onTap: () {
                          showPassword = !showPassword;

                          setState(() {});
                        },
                        child: showPassword
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off)),
                    hintText: "Enter Password",
                    labelText: "Password",
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 141, 192, 240)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 33, 34, 35)),
                    ),
                    fillColor: const Color.fromARGB(255, 194, 213, 229),
                    filled: true),
              ),
            ),

            ///LOGIN BUTTON
            GestureDetector(
              onTap: () async {
                if (_emailController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty) {
                  try {
                    UserCredential userCredential =
                        await _firebaseAuth.createUserWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text);
                    log("UserCredentials : ${userCredential.user!.email}");
                  await  SnackbarWidget.showSnackBar(
                        context, "User Register Successfully");
                    Navigator.of(context).pop();
                  } on FirebaseAuthException catch (error) {
                    log("${error.code}");
                    log("${error.message}");
                    SnackbarWidget.showSnackBar(context, error.message!);
                  }

                  
                }else{
                  SnackbarWidget.showSnackBar(context, "Please enter valid feilds");
                }
              },
              child: Container(
                height: 20,
                width: 50,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(234, 173, 173, 1),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 5),
                        color: Colors.grey,
                        blurRadius: 10,
                        spreadRadius: 0
                      ),
                    ]
                    ),
                child: Text(
                  "Register",
                  style: GoogleFonts.zeyada(
                      fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
