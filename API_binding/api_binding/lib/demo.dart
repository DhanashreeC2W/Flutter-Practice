import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  String? weather;

  Future<void> fetchWeather() async {
    const apiKey = "YOUR_API_KEY";
    const city = "London";
    final url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey");
    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        weather = data["weather"][0]["description"];
      });
    } else {
      print("Error: ${response.reasonPhrase}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weather App")),
      body: Center(
        child: weather == null
            ? const Text("Press the button to fetch weather")
            : Text("Weather: $weather"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchWeather,
        child: const Icon(Icons.cloud),
      ),
    );
  }
}
