import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchAndNavigateMap extends StatefulWidget {
  const SearchAndNavigateMap({super.key});

  @override
  State<SearchAndNavigateMap> createState() => _SearchAndNavigateMapState();
}

class _SearchAndNavigateMapState extends State<SearchAndNavigateMap> {
  /// LIST OF FORT LOCATIONS
  final List<Map<String, dynamic>> locationList = [
    {"Raigad Fort": {"lat": 18.2350, "lang": 73.4462}},
    {"Sinhagad Fort": {"lat": 18.3667, "lang": 73.7500}},
    {"Pratapgad Fort": {"lat": 17.9344, "lang": 73.5772}},
    {"Shivneri Fort": {"lat": 19.2006, "lang": 73.8608}},
    {"Rajgad Fort": {"lat": 18.2486, "lang": 73.6789}},
    {"Torna Fort": {"lat": 18.2694, "lang": 73.6222}},
    {"Lohagad Fort": {"lat": 18.7069, "lang": 73.4792}},
    {"Visapur Fort": {"lat": 18.6986, "lang": 73.4889}},
    {"Harishchandragad Fort": {"lat": 19.3861, "lang": 73.7758}},
    {"Sindhudurg Fort": {"lat": 16.0439, "lang": 73.4622}},
    {"Murud-Janjira Fort": {"lat": 18.2983, "lang": 72.9619}},
    {"Panhala Fort": {"lat": 16.8131, "lang": 74.1183}},
    {"Daulatabad Fort": {"lat": 19.9422, "lang": 75.2139}},
    {"Ajinkyatara Fort": {"lat": 17.6856, "lang": 74.0028}},
  ];

  GoogleMapController? _controller;
  LatLng? _currentLocation;
  LatLng? _destination;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  /// GET USER'S CURRENT LOCATION
  Future<void> _getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentLocation = LatLng(position.latitude, position.longitude);
    });
  }

  /// SEARCH FOR FORT BY NAME (case-insensitive)
  void _setDestination(String fortName) {
    fortName = fortName.trim().toLowerCase();

    for (var fort in locationList) {
      /// Each item looks like: { "FortName": { "lat": x, "lang": y } }
      String key = fort.keys.first.toLowerCase();

      if (key == fortName) {
        double lat = fort.values.first["lat"];
        double lng = fort.values.first["lang"];
        log("$fortName found: lat=$lat, lng=$lng");

        setState(() {
          _destination = LatLng(lat, lng);
        });

        _controller?.animateCamera(CameraUpdate.newLatLngZoom(_destination!, 14));
        return;
      }
    }

    /// If fort not found
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Fort '$fortName' not found in list")),
    );
  }

  /// OPEN GOOGLE MAPS NAVIGATION
  Future<void> _startNavigation() async {
    if (_currentLocation == null || _destination == null) return;

    final Uri googleUrl = Uri.parse(
      'https://www.google.com/maps/dir/?api=1'
      '&origin=${_currentLocation!.latitude},${_currentLocation!.longitude}'
      '&destination=${_destination!.latitude},${_destination!.longitude}'
      '&travelmode=driving',
    );

    if (await canLaunchUrl(googleUrl)) {
      await launchUrl(googleUrl, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Could not open Google Maps")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fort Navigator")),
      body: _currentLocation == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                /// SEARCH BAR
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: const InputDecoration(
                            hintText: "Enter Fort Name (e.g. Shivneri Fort)",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          _setDestination(_searchController.text);
                        },
                      ),
                    ],
                  ),
                ),

                /// START NAVIGATION BUTTON
                if (_destination != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                      onPressed: _startNavigation,
                      icon: const Icon(Icons.navigation),
                      label: const Text("Start Directions"),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                    ),
                  ),

                /// MAP VIEW
                Expanded(
                  child: GoogleMap(
                    onMapCreated: (controller) => _controller = controller,
                    initialCameraPosition: CameraPosition(
                      target: _currentLocation!,
                      zoom: 14,
                    ),
                    markers: {
                      /// CURRENT LOCATION MARKER
                      Marker(
                        markerId: const MarkerId("current"),
                        position: _currentLocation!,
                        infoWindow: const InfoWindow(title: "You are here"),
                      ),

                      /// DESTINATION MARKER
                      if (_destination != null)
                        Marker(
                          markerId: const MarkerId("destination"),
                          position: _destination!,
                          infoWindow: const InfoWindow(title: "Destination"),
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueRed,
                          ),
                        ),
                    },
                    myLocationEnabled: true,
                  ),
                ),
              ],
            ),
    );
  }
}
