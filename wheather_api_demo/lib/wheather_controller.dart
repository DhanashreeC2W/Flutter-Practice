import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class WheatherController {
  final String apiKey = "c70158ae5049693b117c009c192c2e80";

  Future<Map<String, dynamic>?> fetchWheather(String city) async {
    final url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";

    final respone = await http.get(Uri.parse(url));

    if (respone.statusCode == 200) {
      log(respone.body);
      Map<String, dynamic> data = json.decode(respone.body);
      return data;
    } else {
      log("${respone.statusCode} error");
      return null;
    }
  }
}
