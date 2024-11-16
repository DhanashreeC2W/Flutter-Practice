import 'package:flutter/material.dart';

class SnackbarWidget {
  static showSnackBar(BuildContext context, String snackMsg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(snackMsg),
      dismissDirection: DismissDirection.endToStart,
      backgroundColor: const Color.fromRGBO(112, 112, 112, 1),
    ));
  }
}
