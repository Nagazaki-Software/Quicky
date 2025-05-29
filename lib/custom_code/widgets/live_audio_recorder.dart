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

class LiveAudioRecorder extends StatefulWidget {
  final double width;
  final double height;
  const LiveAudioRecorder({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  _LiveAudioRecorderState createState() => _LiveAudioRecorderState();
}

class _LiveAudioRecorderState extends State<LiveAudioRecorder> {
  late RecorderController recorderController;
  bool isRecording = false;

  @override
  void initState() {
    super.initState();
    recorderController = RecorderController()
      ..androidEncoder = AndroidEncoder.aac
      ..androidOutputFormat = AndroidOutputFormat.mpeg4
      ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
      ..sampleRate = 16000;
  }

  void startOrStopRecording() async {
    if (isRecording) {
      final path = await recorderController.stop();
      print("Recording saved at: $path");
      setState(() => isRecording = false);
    } else {
      await recorderController.record(path: '');
      setState(() => isRecording = true);
    }
  }

  @override
  void dispose() {
    recorderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AudioWaveforms(
          enableGesture: false,
          size: Size(MediaQuery.of(context).size.width, 50),
          recorderController: recorderController,
          waveStyle: const WaveStyle(
            waveColor: Colors.blue,
            extendWaveform: true,
            showMiddleLine: false,
          ),
        ),
        IconButton(
          icon: Icon(isRecording ? Icons.stop : Icons.mic),
          onPressed: startOrStopRecording,
        ),
      ],
    );
  }
}
