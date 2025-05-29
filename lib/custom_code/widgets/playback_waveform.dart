// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:audio_waveforms/audio_waveforms.dart';

class PlaybackWaveform extends StatefulWidget {
  final String audioPath;
  final double width;
  final double height;

  const PlaybackWaveform({
    Key? key,
    required this.audioPath,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  _PlaybackWaveformState createState() => _PlaybackWaveformState();
}

class _PlaybackWaveformState extends State<PlaybackWaveform> {
  late PlayerController playerController;

  @override
  void initState() {
    super.initState();
    playerController = PlayerController();
    playerController.preparePlayer(path: widget.audioPath);
  }

  @override
  void dispose() {
    playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AudioFileWaveforms(
          playerController: playerController,
          size: Size(widget.width, widget.height),
          enableSeekGesture: true,
        ),
        IconButton(
          icon: Icon(Icons.play_arrow),
          onPressed: () {
            playerController
                .startPlayer(); // Corrigido: removeu o parâmetro finishMode
          },
        ),
      ],
    );
  }
}
