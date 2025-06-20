// Automatic FlutterFlow imports
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_camera_overlay/model.dart';
import 'package:flutter_camera_overlay/flutter_camera_overlay.dart';
import 'package:camera/camera.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class TriggerCameraOverlay extends StatefulWidget {
  const TriggerCameraOverlay({
    super.key,
    this.width,
    this.height,
    this.cardType,
    this.infoText,
    this.labelText,
    this.buttonText,
    this.buttonColor,
    this.onCapture,
    this.borderRadius,
    this.padding,
    this.rotateCamera,
  });

  final double? width;
  final double? height;
  final int? cardType;
  final String? infoText;
  final String? labelText;
  final String? buttonText;
  final Color? buttonColor;
  final Future Function(FFUploadedFile? uploadedId)? onCapture;
  final double? borderRadius;
  final double? padding;
  final bool? rotateCamera;

  @override
  State<TriggerCameraOverlay> createState() => _TriggerCameraOverlayState();
}

class _TriggerCameraOverlayState extends State<TriggerCameraOverlay> {
  late OverlayFormat format;

  @override
  void initState() {
    super.initState();
    _setFormat();
  }

  void _setFormat() {
    switch (widget.cardType) {
      case 1:
        format = OverlayFormat.cardID3;
        break;
      case 2:
        format = OverlayFormat.simID000;
        break;
      case 0:
      default:
        format = OverlayFormat.cardID1;
    }
  }

  Future<void> _launchCameraOverlay() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No camera found')),
      );
      return;
    }

    // Set the orientation to landscape mode if rotateCamera is true
    if (widget.rotateCamera ?? false) {
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }

    final XFile? result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraOverlay(
          cameras.first,
          CardOverlay.byFormat(format),
          (XFile file) {
            Navigator.pop(context, file);
          },
          info: widget.infoText ?? '',
          label: widget.labelText ?? 'Position ID card within rectangle.',
        ),
      ),
    );

    // Revert orientation to the default setting if rotateCamera is true
    if (widget.rotateCamera ?? false) {
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }

    if (result != null) {
      try {
        final bytes = await File(result.path).readAsBytes();
        final capturedImage = FFUploadedFile(
          name: 'captured_image.jpg',
          bytes: Uint8List.fromList(bytes),
          height: null,
          width: null,
          blurHash: null,
        );
        if (widget.onCapture != null) {
          widget.onCapture!(capturedImage); // return captured image
        }
      } catch (e) {
        print('Error converting captured image to FFUploadedFile: $e');
        if (widget.onCapture != null) {
          widget.onCapture!(null);
        }
      }
    } else {
      if (widget.onCapture != null) {
        widget.onCapture!(null);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _launchCameraOverlay,
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.buttonColor ?? Theme.of(context).primaryColor,
        minimumSize: Size(widget.width ?? double.infinity,
            widget.height ?? 50.0), // Set button size
        padding: EdgeInsets.all(
            widget.padding ?? 8.0), // Convert double to EdgeInsets
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              widget.borderRadius ?? 8.0), // Apply border radius
        ),
      ),
      child: Text(widget.buttonText ?? 'Launch Camera'),
    );
  }
}
