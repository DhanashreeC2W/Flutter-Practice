import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
///SELF LOCATION TRACKER
class SelfLocationMap extends StatefulWidget {
  const SelfLocationMap({super.key});

  @override
  State<SelfLocationMap> createState() => _SelfLocationMapState();
}

class _SelfLocationMapState extends State<SelfLocationMap> {
  GoogleMapController? _controller;
  LatLng? _currentPosition;

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  /// FUNCTION TO DETERMINE CURRENT LOCATION
  Future<void> _determinePosition() async {
    /// ASK PERMISSION
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.deniedForever ||
        permission == LocationPermission.denied) return;

    /// GET CURRENT POSITION
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
    });

    /// MOVE CAMERA TO CURRENT LOCATION
    _controller?.animateCamera(CameraUpdate.newLatLngZoom(_currentPosition!, 15));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Location")),
      body: _currentPosition == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              onMapCreated: (controller) => _controller = controller,
              initialCameraPosition: CameraPosition(
                target: _currentPosition!,
                zoom: 15,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId("me"),
                  position: _currentPosition!,
                  infoWindow: const InfoWindow(title: "You are here"),
                ),
              },
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
            ),
    );
  }
}
