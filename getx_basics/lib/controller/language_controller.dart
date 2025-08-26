import 'dart:ui';

import 'package:get/get.dart';

class LanguageController extends GetxController {
  void changeLanguage(var para1, var para2) {
    var locale = Locale(para1, para2);
    Get.updateLocale(locale);
  }
}
