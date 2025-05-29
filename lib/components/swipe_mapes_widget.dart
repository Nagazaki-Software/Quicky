import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'swipe_mapes_model.dart';
export 'swipe_mapes_model.dart';

class SwipeMapesWidget extends StatefulWidget {
  const SwipeMapesWidget({super.key});

  @override
  State<SwipeMapesWidget> createState() => _SwipeMapesWidgetState();
}

class _SwipeMapesWidgetState extends State<SwipeMapesWidget> {
  late SwipeMapesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwipeMapesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 80.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: FlutterFlowGoogleMap(
        controller: _model.googleMapsController,
        onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
        initialLocation: _model.googleMapsCenter ??=
            LatLng(13.106061, -59.613158),
        markerColor: GoogleMarkerColor.violet,
        mapType: MapType.normal,
        style: GoogleMapStyle.standard,
        initialZoom: 14.0,
        allowInteraction: false,
        allowZoom: false,
        showZoomControls: false,
        showLocation: true,
        showCompass: false,
        showMapToolbar: false,
        showTraffic: false,
        centerMapOnMarkerTap: true,
      ),
    );
  }
}
