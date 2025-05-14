import 'package:chat_app/controller/size_controller.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<State>();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
              left: SizeController.screenWidth! * 0.040,
              right: SizeController.screenWidth! * 0.040),
          child: Center(
            child: SizedBox(
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Login"),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Enter Email Address",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Email";
                      } else if (!value.contains(
                        "@",
                      )) {
                        return "Enter valid Email-Id";
                      } else if (!value.contains(
                        ".com",
                      )) {
                        return "Enter valid Email-Id";
                      }
                      return "null";
                    },
                  ),
                  // SizedBox(
                  //   height: SizeController.screenHeight! * 0.04,
                  // ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      hintText: "Enter Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter email address";
                      } else if (_formKey.currentState == null) {
                        return "Enter valid Address";
                      } else {
                        return null;
                      }
                    },
                  ),
                  AnimatedContainer(
                    height: 60,
                    color: Colors.amber,
                    duration: const Duration(milliseconds: 300),
                    transform: Matrix4(25, 25, 25, 25, 25, 25,25, 25, 25, 25, 25, 25, 25, 25, 25, 25),
                  ),
                  Container(
                    height: 40,
                    width: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromRGBO(242, 147, 147, 0.914),
                    ),
                    child: const Text("Login"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
