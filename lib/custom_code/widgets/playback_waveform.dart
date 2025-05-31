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
    this.width = 230,
    this.height = 45,
  }) : super(key: key);

  @override
  _PlaybackWaveformState createState() => _PlaybackWaveformState();
}

class _PlaybackWaveformState extends State<PlaybackWaveform> {
  late final PlayerController playerController;
  bool isPlaying = false;
  bool isReady = false;
  bool isSeeking = false;

  @override
  void initState() {
    super.initState();
    playerController = PlayerController();

    _preparePlayer();

    playerController.onCompletion.listen((_) {
      setState(() {
        isPlaying = false;
      });
    });

    playerController.onCurrentDurationChanged.listen((duration) {
      if (!isSeeking && isPlaying && mounted) {
        setState(() {}); // atualiza UI
      }
    });
  }

  Future<void> _preparePlayer() async {
    try {
      await playerController.preparePlayer(
        path: widget.audioPath,
        shouldExtractWaveform: true,
        noOfSamples: 100, // performance melhor
      );
      setState(() => isReady = true);
    } catch (e) {
      debugPrint('Erro ao preparar player: $e');
    }
  }

  void togglePlayback() async {
    if (!isReady) return;

    if (isPlaying) {
      await playerController.pausePlayer();
    } else {
      await playerController.startPlayer();
    }

    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  void dispose() {
    playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey.shade800 : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: togglePlayback,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: isDark ? Colors.white : Colors.black,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                size: 20,
                color: isDark ? Colors.black : Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 10),
          if (isReady)
            GestureDetector(
              onHorizontalDragStart: (_) => setState(() => isSeeking = true),
              onHorizontalDragEnd: (_) => setState(() => isSeeking = false),
              child: SizedBox(
                width: widget.width,
                height: widget.height,
                child: AudioFileWaveforms(
                  size: Size(widget.width, widget.height),
                  playerController: playerController,
                  enableSeekGesture: true,
                  waveformType: WaveformType.long,
                  playerWaveStyle: PlayerWaveStyle(
                    fixedWaveColor: Colors.grey.shade400,
                    liveWaveColor: isDark ? Colors.white : Colors.black,
                    spacing: 4,
                    showSeekLine: true,
                    seekLineThickness: 2.0,
                    seekLineColor: Colors.blueAccent,
                  ),
                ),
              ),
            )
          else
            const SizedBox(
              width: 100,
              height: 20,
              child: Center(child: Text("Carregando...")),
            ),
        ],
      ),
    );
  }
}
