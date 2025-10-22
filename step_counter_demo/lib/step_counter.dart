import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

class StepCounter extends StatefulWidget {
  const StepCounter({super.key});

  @override
  State<StepCounter> createState() => _StepCounterState();
}

class _StepCounterState extends State<StepCounter> {
  /// STORES CURRENT NUMBER OF STEPS
  int _steps = 0;

  /// STREAM TO LISTEN CONTINUOUSLY FOR STEP EVENTS
  Stream<StepCount>? _stepCountStream;

  /// STATUS MESSAGE (USED TO SHOW IF APP IS WORKING OR ERROR)
  String _status = "Initializing...";

  @override
  void initState() {
    super.initState();

    /// WHEN SCREEN LOADS, ASK FOR PERMISSION AND START STEP COUNTING
    requestPermission();
    initPlatformState();
  }

  /// FUNCTION TO REQUEST ACTIVITY RECOGNITION PERMISSION AT RUNTIME
  Future<void> requestPermission() async {
    var status = await Permission.activityRecognition.status;

    if (!status.isGranted) {
      await Permission.activityRecognition.request();
    }
  }

  /// FUNCTION TO INITIALIZE PEDOMETER STREAM AND START LISTENING
  void initPlatformState() {
    try {
      _stepCountStream = Pedometer.stepCountStream;
      _stepCountStream!.listen(onStepCount).onError(onStepCountError);

      setState(() {
        _status = "Counting Steps...";
      });
    } catch (e) {
      setState(() {
        _status = "Pedometer not available!";
      });
    }
  }

  /// CALLBACK FUNCTION WHEN NEW STEP COUNT EVENT ARRIVES
  void onStepCount(StepCount event) {
    setState(() {
      _steps = event.steps;
      _status = "Counting Steps...";
    });
  }

  /// CALLBACK FUNCTION WHEN ERROR OCCURS IN STREAM
  void onStepCountError(error) {
    debugPrint('Step Count Error: $error');
    setState(() {
      _status = "Error Reading Steps";
    });
  }

  /// FUNCTION TO RESET STEP COUNT LOCALLY (UI PURPOSE ONLY)
  void resetSteps() {
    setState(() {
      _steps = 0;
      _status = "Reset Done!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// SAFE AREA TO AVOID NOTCH / STATUS BAR OVERLAP
      body: Container(
        /// ADDING A BEAUTIFUL LINEAR GRADIENT BACKGROUND
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF7F7FD5), Color(0xFF86A8E7), Color(0xFF91EAE4)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        /// CENTERING ALL CONTENT VERTICALLY AND HORIZONTALLY
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// WALKING ICON TO REPRESENT STEP ACTIVITY
              const Icon(Icons.directions_walk_rounded,
                  color: Colors.white, size: 90),

              const SizedBox(height: 20),

              /// TITLE TEXT
              const Text(
                "STEP COUNTER",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),

              const SizedBox(height: 30),

              /// DISPLAYING STEP COUNT IN BIG BOLD FONT
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  "$_steps",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// STATUS MESSAGE (SHOWS IF ERROR OR RUNNING)
              Text(
                _status,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),

              const SizedBox(height: 40),

              /// RESET BUTTON
              ElevatedButton.icon(
                onPressed: resetSteps,
                icon: const Icon(Icons.refresh),
                label: const Text("RESET"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blueAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
