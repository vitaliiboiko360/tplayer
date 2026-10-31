import 'package:defer_pointer/defer_pointer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tplayer/page_oneline/player_controls/player_controls.dart';
import 'package:tplayer/state/playback_speed_slider.dart';
import 'package:tplayer/ui/button_animated.dart';
import 'package:flutter/services.dart';

const List<double> playbackSpeedValues = [0.85, 0.93, 1];

String f(double value) => '${value}x';

int next(int currentIndex) => (currentIndex + 1) % playbackSpeedValues.length;

const double playbackSpeedButtonDefaultHeight = 50;

class PlaybackSpeedButton extends StatefulWidget {
  PlaybackSpeedButton({super.key, this.onPressed});

  VoidCallback? onPressed;

  @override
  State<PlaybackSpeedButton> createState() => _PlaybackSpeedButtonState();
}

class _PlaybackSpeedButtonState extends State<PlaybackSpeedButton> {
  bool playing = false;

  @override
  Widget build(BuildContext context) {
    return PlaybackSpeedButtonInner(
      isPressed: playing,
      onPressed: () => setState(() {
        playing = !playing;
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
      }),
    );
  }
}

class PlaybackSpeedButtonInner extends StatefulWidget {
  const PlaybackSpeedButtonInner({
    super.key,
    required this.isPressed,
    required this.onPressed,
    this.size = playbackSpeedButtonDefaultHeight,
    this.color = const Color(0xFFffd23f),
    this.shadowColor = const Color(0xFFc9971a),
  });

  final bool isPressed;
  final VoidCallback onPressed;
  final double size;
  final Color color;
  final Color shadowColor;

  @override
  State<PlaybackSpeedButtonInner> createState() =>
      _PlaybackSpeedButtonUIState();
}

class _PlaybackSpeedButtonUIState extends State<PlaybackSpeedButtonInner> {
  bool _pressed = false;
  int _playbackSpeedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final depth = widget.size * 0.1; // height of the 3D edge
    final travel = _pressed ? depth * 0.7 : 0.0; // how far the face sinks

    return Semantics(
      button: true,
      label: widget.isPressed ? 'Pressed' : 'Unpressed',
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) => setState(() => _pressed = true),
        onTapCancel: () => setState(() => _pressed = false),
        onTapUp: (_) {
          setState(() => _pressed = false);
          setState(() => _playbackSpeedIndex = next(_playbackSpeedIndex));
          print('index is $_playbackSpeedIndex');
          HapticFeedback.lightImpact();
          widget.onPressed();
        },
        child: SizedBox(
          width: widget.size,
          height: widget.size + depth,
          child: Stack(
            children: [
              // Bottom edge (the 3D "thickness") plus soft drop shadow
              Positioned(
                top: depth,
                left: 0,
                right: 0,
                child: Container(
                  height: widget.size,
                  decoration: BoxDecoration(
                    color: widget.shadowColor,
                    shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(
                        color: const Color(0x40000000),
                        blurRadius: 24,
                        offset: Offset(0, 14),
                      ),
                    ],
                  ),
                ),
              ),
              // Top face, slides down when pressed
              AnimatedPositioned(
                duration: const Duration(milliseconds: 80),
                curve: Curves.easeOut,
                top: travel,
                left: 0,
                right: 0,
                child: Container(
                  height: widget.size,
                  decoration: BoxDecoration(
                    color: widget.color,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 150),
                      transitionBuilder: (child, anim) =>
                          ScaleTransition(scale: anim, child: child),
                      child: Text(
                        f(playbackSpeedValues[_playbackSpeedIndex]),
                        strutStyle: StrutStyle(height: 1),
                        style: TextStyle(
                          color: Color(0xCF4a3a00),
                          fontSize: 18,
                          fontWeight: FontWeight(700),
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
