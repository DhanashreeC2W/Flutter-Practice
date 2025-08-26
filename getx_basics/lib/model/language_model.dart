import 'package:get/get.dart';

class LanguageModel extends Translations {
  Map<String, Map<String, String>> get keys => {
        'en_US': {"hello": "Hello"},
        'hi_IN': {"hello": "Namskar"},
        'french_FR': {"hello": "bonjour"}
      };
}
