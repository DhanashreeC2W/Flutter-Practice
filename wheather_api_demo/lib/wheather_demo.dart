import 'package:flutter/material.dart';
import 'package:wheather_api_demo/wheather_controller.dart';

class WheatherDemo extends StatefulWidget {
  const WheatherDemo({super.key});

  @override
  State<WheatherDemo> createState() => _WheatherDemoState();
}

class _WheatherDemoState extends State<WheatherDemo> {
  TextEditingController cityController = TextEditingController();
  Map<String, dynamic>? wdata;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: cityController,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              ElevatedButton(
                onPressed: () async {
                  final data = await WheatherController().fetchWheather(
                    cityController.text,
                  );
                  wdata = data;
                  setState(() {});
                },
                child: Text("Get wheather"),
              ),
              wdata != null
                  ? Text(
                      "${wdata!['main']['temp']}°C",
                      style: const TextStyle(fontSize: 40),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
