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
                          fontWeight: FontWeight.w500,
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

// old impl

class PlaybackSpeedButtonOld extends StatelessWidget {
  static const PlaybackSpeedButtonOldKey = 'PLAYBACK_SPEED_BUTTON_KEY';

  void _onTap(BuildContext context) {
    BlocProvider.of<PlaybackSpeedSliderCubit>(context).toggle();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsetsGeometry.directional(start: 0),
        child: SizedBox(
          width: 58,
          height: 30,
          child: Container(
            child: TapRegion(
              groupId: playbackSpeedTapRegionObjectGroupId,
              child: ButtonAnimated(
                label: '',
                onTap: () => _onTap(context),
                child: Text(
                  '0.85x',
                  textHeightBehavior: const TextHeightBehavior(
                    applyHeightToFirstAscent: false,
                    applyHeightToLastDescent: true,
                  ),
                  strutStyle: StrutStyle(height: 1),
                  style: TextStyle(
                    color: Color(0xFF4C506B),
                    fontSize: 18,
                    height: 1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PlaybackSpeedSlider extends StatefulWidget {
  PlaybackSpeedSlider({super.key});

  @override
  State<PlaybackSpeedSlider> createState() => _PlaybackSpeedSliderState();
}

class _PlaybackSpeedSliderState extends State<PlaybackSpeedSlider>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<Offset>? _offsetAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      reverseDuration: Duration(milliseconds: 100),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller!, curve: Curves.easeInOut));
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var showDetailsMenuState = BlocProvider.of<PlaybackSpeedSliderCubit>(
      context,
      listen: true,
    );

    if (showDetailsMenuState.state.isOpened) {
      setState(() {
        _controller?.forward();
      });
    } else {
      setState(() {
        _controller?.reverse();
      });
    }

    return Positioned(
      top: -50,
      right: 0,
      width: 150,
      height: 50,
      child: DeferPointer(
        child: Container(
          width: 150,
          height: 50,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(),
          child: SlideTransition(
            position: _offsetAnimation!,
            child: Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(),
              child: TapRegion(
                groupId: playbackSpeedTapRegionObjectGroupId,
                onTapOutside: (PointerDownEvent event) async {
                  if (showDetailsMenuState.state.isOpened) {
                    showDetailsMenuState.setClose();
                  }
                },
                child: PlaybackSpeedSliderInner(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PlaybackSpeedSliderInner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PlaybackSpeedSliderInnerState();
}

class _PlaybackSpeedSliderInnerState extends State<PlaybackSpeedSliderInner> {
  late double _sliderValue;

  void _sliderOnChanged(double value) {
    setState(() {
      _sliderValue = value;
    });
  }

  @override
  void initState() {
    _sliderValue = 0.5;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 4.0,
        trackShape: SameHeightTrackShape(),
        // activeTrackColor: Colors.blue,
        inactiveTrackColor: Colors.grey.withValues(alpha: 0.4),
        padding: EdgeInsetsGeometry.directional(
          start: 24,
          end: 22,
          top: 4,
          bottom: 4,
        ),
      ),
      child: Slider(value: _sliderValue, onChanged: _sliderOnChanged),
    );
  }
}

class SameHeightTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    Offset offset = Offset.zero,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 2.0;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required TextDirection textDirection,
    required Offset thumbCenter,
    Offset? secondaryOffset,
    bool isEnabled = false,
    bool isDiscrete = false,
    double additionalActiveTrackHeight = 0,
  }) {
    // Override additionalActiveTrackHeight to 0 to keep the active track flat and even
    super.paint(
      context,
      offset,
      parentBox: parentBox,
      sliderTheme: sliderTheme,
      enableAnimation: enableAnimation,
      textDirection: textDirection,
      thumbCenter: thumbCenter,
      secondaryOffset: secondaryOffset,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
      additionalActiveTrackHeight: 0,
    );
  }
}
