// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlong;
import 'package:ff_commons/flutter_flow/lat_lng.dart' as ffLatLng;

class PlacePickerWidget extends StatefulWidget {
  const PlacePickerWidget({
    Key? key,
    this.initialZoom = 11,
    this.minZoomLevel = 5,
    this.maxZoomLevel = 16,
    required this.width,
    required this.height,
    this.onPlacePicked,
  }) : super(key: key);

  final double initialZoom;
  final double minZoomLevel;
  final double maxZoomLevel;
  final double width;
  final double height;

  final Future Function(ffLatLng.LatLng selectedPlace)? onPlacePicked;

  @override
  State<PlacePickerWidget> createState() => _PlacePickerWidgetState();
}

class _PlacePickerWidgetState extends State<PlacePickerWidget> {
  latlong.LatLng? selectedLatLng;
  latlong.LatLng currentLocation =
      latlong.LatLng(-23.5505, -46.6333); // default São Paulo

  void _onPlacePickedHandler(latlong.LatLng latLng) async {
    setState(() {
      selectedLatLng = latLng;
    });

    // Converte latlong.LatLng para ffLatLng.LatLng
    final ffLatLngLatLng = ffLatLng.LatLng(latLng.latitude, latLng.longitude);

    if (widget.onPlacePicked != null) {
      await widget.onPlacePicked!(ffLatLngLatLng);
    }
  }

  void _centerOnUser() {
    // Aqui poderia pegar localização real do usuário via geolocator, mas para exemplo:
    setState(() {
      currentLocation = latlong.LatLng(-23.5505, -46.6333); // Exemplo fixo
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: currentLocation,
              initialZoom: widget.initialZoom,
              minZoom: widget.minZoomLevel,
              maxZoom: widget.maxZoomLevel,
              onTap: (tapPosition, point) => _onPlacePickedHandler(point),
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: const ['a', 'b', 'c'],
              ),
              if (selectedLatLng != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: selectedLatLng!,
                      width: 60,
                      height: 60,
                      child: const Icon(
                        Icons.location_on,
                        size: 40,
                        color: Colors.brown,
                      ),
                    ),
                  ],
                ),
            ],
          ),

          // Botão para centralizar na localização atual
          Positioned(
            top: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: _centerOnUser,
              child: const Icon(Icons.my_location),
              backgroundColor: Colors.brown,
              mini: true,
            ),
          ),

          // Barra de pesquisa (sem funcionalidade de busca implementada)
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.search, color: Colors.brown),
                  hintText: "Buscar localização",
                  border: InputBorder.none,
                ),
                onChanged: (query) {
                  // Aqui você pode implementar busca com API de lugares
                  print("Busca: $query");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
