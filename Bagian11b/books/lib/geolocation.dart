import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
// import "package:location/location.dart" as loc;

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  // String myPosition = '';
  Future<Position>? position;

  @override
  void initState() {
    super.initState();
    position = getPosition();
    print("Position:");
    print(position.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Current Location Avicenna')),
      body: Center(
        child: FutureBuilder(
            future: position,
            builder: (context, AsyncSnapshot<Position> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  print("Error: ${snapshot.error}");
                  return const Text('Something terrible happened!');
                }

                if (snapshot.data == null) {
                  print("Error: Snapshot data is null");
                  return const Text('Unable to fetch location.');
                }

                if (snapshot.hasData) {
                  print("Latitude: ${snapshot.data!.latitude}");
                  print("Longitude: ${snapshot.data!.longitude}");
                  LatLng currentLocation = LatLng(
                    snapshot.data!.latitude,
                    snapshot.data!.longitude,
                  );
                  return FlutterMap(
                    options: MapOptions(
                      initialCenter: currentLocation,
                      initialZoom: 13.0,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                        // subdomains: const ['a', 'b', 'c'],
                        // userAgentPackageName: "com.example.yourapp",
                      ),
                    ],
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              } else {
                return const Text('');
              }
            }),
      ),
    );
  }

  Future<Position> getPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permission denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permission permanently denied.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
