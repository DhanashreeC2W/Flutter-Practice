import 'dart:developer';

import 'package:app/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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
              "LOGIN",
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
                UserCredential userCredential;
                if (_emailController.text.trim().isNotEmpty &&
                    _passwordController.text.trim().isNotEmpty) {
                  userCredential =
                      await _firebaseAuth.signInWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text);
                          log("$userCredential");
                }
              },
              child: Container(
                height: 20,
                width: 50,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(234, 173, 173, 1)),
                child: Text(
                  "Login",
                  style: GoogleFonts.zeyada(
                      fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const RegistrationScreen();
                }));
              },
              child: Text(
                "Don't Have an Account?Register",
                style: GoogleFonts.yaldevi(
                    fontSize: 12, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
