import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

class PlayPauseButtonUI extends StatefulWidget {
  const PlayPauseButtonUI({
    super.key,
    required this.isPlaying,
    required this.onPressed,
    this.size = 124,
    this.color = const Color(0xFFFF6B4A),
    this.shadowColor = const Color(0xFFC4402A),
  });

  final bool isPlaying;
  final VoidCallback onPressed;
  final double size;
  final Color color;
  final Color shadowColor;

  @override
  State<PlayPauseButtonUI> createState() => _PlayPauseButtonUIState();
}

class _PlayPauseButtonUIState extends State<PlayPauseButtonUI> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final depth = widget.size * 0.1; // height of the 3D edge
    final travel = _pressed ? depth * 0.7 : 0.0; // how far the face sinks

    return Semantics(
      button: true,
      label: widget.isPlaying ? 'Pause' : 'Play',
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) => setState(() => _pressed = true),
        onTapCancel: () => setState(() => _pressed = false),
        onTapUp: (_) {
          setState(() => _pressed = false);
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
                        color: Color(0x40000000),
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
                      child: Icon(
                        widget.isPlaying
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                        key: ValueKey(widget.isPlaying),
                        size: widget.size * 0.55,
                        color: Colors.white,
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
