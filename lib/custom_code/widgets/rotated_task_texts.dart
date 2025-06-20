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

class RotatedTaskTexts extends StatefulWidget {
  const RotatedTaskTexts({
    super.key,
    this.width,
    this.height,
    required this.text,
    required this.cor,
  });

  final double? width;
  final double? height;
  final String text;
  final Color? cor;

  @override
  State<RotatedTaskTexts> createState() => _RotatedTaskTextsState();
}

class _RotatedTaskTextsState extends State<RotatedTaskTexts> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: 16,
                color: widget.cor,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
