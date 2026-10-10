import 'package:flutter/material.dart';
import 'package:tplayer/page_oneline/player_controls/playpause_button.dart';

class PlayPauseButtonModel extends StatefulWidget {
  const PlayPauseButtonModel({super.key});

  @override
  State<PlayPauseButtonModel> createState() => _PlayPauseButtonModelState();
}

class _PlayPauseButtonModelState extends State<PlayPauseButtonModel> {
  bool playing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7A7CFF),
      body: Center(
        child: PlayPauseButtonUI(
          isPlaying: playing,
          onPressed: () => setState(() => playing = !playing),
        ),
      ),
    );
  }
}
