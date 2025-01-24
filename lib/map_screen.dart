import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MumbaiMapScreen extends StatefulWidget {
  const MumbaiMapScreen({Key? key}) : super(key: key);

  @override
  State<MumbaiMapScreen> createState() => _MumbaiMapScreenState();
}

class _MumbaiMapScreenState extends State<MumbaiMapScreen> {
  final mapController = MapController();
  final double latitude = 22.3188;
  final double longitude = 73.1709;

  void _zoomIn() {
    final zoom = mapController.zoom + 1;
    mapController.move(LatLng(latitude, longitude), zoom);
  }

  void _zoomOut() {
    final zoom = mapController.zoom - 1;
    mapController.move(LatLng(latitude, longitude), zoom);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mumbai Map View',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 2,
      ),
      body: Stack(
        children: [
          // Map displaying OpenStreetMap tiles
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              center: LatLng(latitude, longitude),
              zoom: 13.0,
              maxZoom: 18.0,
              minZoom: 3.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'],
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(latitude, longitude),
                    width: 80,
                    height: 80,
                    child: Container(
                      child: const Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Zoom in and zoom out buttons
          Positioned(
            right: 16,
            bottom: 16,
            child: Column(
              children: [
                FloatingActionButton(
                  heroTag: "zoomIn",
                  mini: true,
                  onPressed: _zoomIn,
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 8),
                FloatingActionButton(
                  heroTag: "zoomOut",
                  mini: true,
                  onPressed: _zoomOut,
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          ),
          // Location info card
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Location Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Latitude: $latitude',
                      style: const TextStyle(fontSize: 14),
                    ),
                    Text(
                      'Longitude: $longitude',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
