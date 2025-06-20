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
  late final double width;
  late final double height;

  bool isPlaying = false;
  bool isReady = false;
  bool isSeeking = false;

  @override
  void initState() {
    super.initState();
    playerController = PlayerController();
    width = widget.width;
    height = widget.height;

    _preparePlayer();

    playerController.onCompletion.listen((_) async {
      setState(() {
        isPlaying = false;
      });

      try {
        await playerController.stopPlayer();
        await playerController.seekTo(0); // Reset para início
      } catch (e) {
        debugPrint("Erro ao resetar player: $e");
      }
    });

    playerController.onCurrentDurationChanged.listen((duration) {
      if (mounted && isPlaying && !isSeeking) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) setState(() {});
        });
      }
    });
  }

  Future<void> _preparePlayer() async {
    try {
      await playerController.preparePlayer(
        path: widget.audioPath,
        shouldExtractWaveform: true,
        noOfSamples: 100,
      );
      setState(() => isReady = true);
    } catch (e) {
      debugPrint('Erro ao preparar player: $e');
    }
  }

  void togglePlayback() async {
    if (!isReady) return;

    try {
      if (isPlaying) {
        await playerController.pausePlayer();
      } else {
        await playerController.startPlayer();
      }
      setState(() {
        isPlaying = !isPlaying;
      });
    } catch (e) {
      debugPrint("Erro ao alternar reprodução: $e");
    }
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
      constraints: BoxConstraints(
        minWidth: width + 50,
        minHeight: height + 20,
      ),
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  width: width,
                  height: height,
                  child: AudioFileWaveforms(
                    size: Size(width, height),
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
              ),
            )
          else
            const SizedBox(
              width: 100,
              height: 20,
              child: Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
        ],
      ),
    );
  }
}
