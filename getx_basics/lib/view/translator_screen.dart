import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_basics/controller/language_controller.dart';

class TranslatorScreen extends StatelessWidget {
  LanguageController languageController = Get.put(LanguageController());
  // const TranslatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              'hello'.tr,
            ),
            ElevatedButton(
                onPressed: () {
                  languageController.changeLanguage('hi', 'IN');
                },
                style: const ButtonStyle(
                    fixedSize: WidgetStatePropertyAll(Size(200, 80))),
                child: const Text("Marathi")),
            ElevatedButton(onPressed: () {
                  languageController.changeLanguage('en', 'US');

            }, child: const Text("English")),
            ElevatedButton(onPressed: () {
                  languageController.changeLanguage('french', 'FR');

            }, child: const Text("French"))
          ],
        ),
      ),
    );
  }
}
