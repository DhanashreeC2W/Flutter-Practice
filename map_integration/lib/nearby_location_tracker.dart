import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class NearbyDoctorsMap extends StatefulWidget {
  const NearbyDoctorsMap({super.key});

  @override
  State<NearbyDoctorsMap> createState() => _NearbyDoctorsMapState();
}

class _NearbyDoctorsMapState extends State<NearbyDoctorsMap> {
  GoogleMapController? _controller;
  LatLng? _patientLocation;

  /// SAMPLE DOCTORS LIST (Can be fetched from Firestore or API)
  final List<Map<String, dynamic>> doctors = [
    {"name": "Dr. Sharma", "lat": 18.5215, "lng": 73.8540},
    {"name": "Dr. Patil", "lat": 18.5230, "lng": 73.8575},
    {"name": "Dr. Mehta", "lat": 18.5185, "lng": 73.8500},
  ];

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.deniedForever ||
        permission == LocationPermission.denied) return;

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _patientLocation = LatLng(position.latitude, position.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nearby Doctors")),
      body: _patientLocation == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              onMapCreated: (controller) => _controller = controller,
              initialCameraPosition: CameraPosition(
                target: _patientLocation!,
                zoom: 14,
              ),
              markers: {
                /// MARKER FOR PATIENT
                Marker(
                  markerId: const MarkerId("patient"),
                  position: _patientLocation!,
                  infoWindow: const InfoWindow(title: "You (Patient)"),
                  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
                ),
                /// MARKERS FOR DOCTORS
                ...doctors.map((doc) {
                  return Marker(
                    markerId: MarkerId(doc["name"]),
                    position: LatLng(doc["lat"], doc["lng"]),
                    infoWindow: InfoWindow(title: doc["name"]),
                    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
                  );
                }),
              },
            ),
    );
  }
}
