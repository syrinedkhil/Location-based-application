import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';


class MapForm extends StatefulWidget {
  const MapForm({Key? key}) : super(key: key);

  @override
  _MapFormState createState() => _MapFormState();
}

class _MapFormState extends State<MapForm> {
  LatLng? _selectedPosition;
  final TextEditingController _locationNameController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final MapController _mapController = MapController();
  final double _defaultZoom = 13.0;

  void _handleTap(LatLng point) {
    setState(() {
      _selectedPosition = point;
    });
  }

  void _saveLocation() {
    if (_selectedPosition != null) {
      final String locationName = _locationNameController.text.trim();
      // Do something with the location name and selected position
    }
  }

  void _searchLocation() async {
    final String searchText = _searchController.text.trim();
    if (searchText.isNotEmpty) {
      try {
        List<Location> locations = await locationFromAddress(searchText);
        if (locations.isNotEmpty) {
          _mapController.move(
            LatLng(locations.first.latitude, locations.first.longitude),
            _defaultZoom,
          );
          setState(() {
            _selectedPosition =
                LatLng(locations.first.latitude, locations.first.longitude);
          });
        }
      } catch (e) {
        // Handle error
        print(e.toString());
      }
    }
  }


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      
      body: Column(
        children: [
          Flexible(
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                center: LatLng(45.5231, -122.6765),
                zoom: _defaultZoom,
                onTap: (tapPosition, latLng) => _handleTap(latLng),
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                ),
                if (_selectedPosition != null)
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: _selectedPosition!,
                        builder: (context) => const Icon(Icons.location_on),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
          ),
        ],
      ),
      
    );
  }
}




