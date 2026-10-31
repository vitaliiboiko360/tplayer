import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tplayer/state/settings_menu.dart';
import 'package:tplayer/ui/button_animated.dart';

const double settingsButtonDefaultHeight = 50;

class SettingsButton extends StatefulWidget {
  SettingsButton({super.key, this.onPressed});

  VoidCallback? onPressed;

  @override
  State<SettingsButton> createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> {
  bool playing = false;

  @override
  Widget build(BuildContext context) {
    return SettingsButtonInner(
      isPlaying: playing,
      onPressed: () => setState(() {
        playing = !playing;
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
      }),
    );
  }
}

class SettingsButtonInner extends StatefulWidget {
  const SettingsButtonInner({
    super.key,
    required this.isPlaying,
    required this.onPressed,
    this.size = settingsButtonDefaultHeight,
    this.color = const Color(0xFFffd23f),
    this.shadowColor = const Color(0xFFc9971a),
  });

  final bool isPlaying;
  final VoidCallback onPressed;
  final double size;
  final Color color;
  final Color shadowColor;

  @override
  State<SettingsButtonInner> createState() => _SettingsButtonUIState();
}

class _SettingsButtonUIState extends State<SettingsButtonInner> {
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
                        Icons.settings,
                        // key: ValueKey(widget.isPlaying),
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
