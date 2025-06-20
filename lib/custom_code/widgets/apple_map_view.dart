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

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'package:apple_maps_flutter/apple_maps_flutter.dart' as apple_maps;
import 'package:ff_commons/flutter_flow/lat_lng.dart' as ff_latlng;

class AppleMapView extends StatefulWidget {
  const AppleMapView({
    Key? key,
    required this.userSet, // Local do usuário (Latitude, Longitude)
    required this.width,
    required this.height,
    this.zoom = 15.0, // Nível de zoom padrão
  }) : super(key: key);

  final ff_latlng.LatLng userSet; // Coordenadas do local
  final double zoom; // Nível de zoom
  final double width; // Largura do mapa
  final double height; // Altura do mapa

  @override
  _AppleMapViewState createState() => _AppleMapViewState();
}

class _AppleMapViewState extends State<AppleMapView> {
  @override
  Widget build(BuildContext context) {
    final target = apple_maps.LatLng(
      widget.userSet.latitude,
      widget.userSet.longitude,
    );

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: apple_maps.AppleMap(
        initialCameraPosition: apple_maps.CameraPosition(
          target: target, // Centraliza no local definido
          zoom: widget.zoom, // Define o nível de zoom
        ),
        annotations: {
          // Adiciona o marcador fixo
          apple_maps.Annotation(
            annotationId: apple_maps.AnnotationId('user-location'),
            position: target,
            infoWindow: const apple_maps.InfoWindow(title: 'Local Selecionado'),
          ),
        },
        // Desabilitar interações com o mapa para só visualização
        onMapCreated: (_) {}, // Não precisamos do controlador
        onTap: (_) {}, // Ignora toques
      ),
    );
  }
}
