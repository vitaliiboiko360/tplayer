import 'package:flutter/material.dart';

class PlayPauseButton extends StatelessWidget {
  @override
  Widget build(Object context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: Button(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(0, 0),
              radius: 0.15,
              colors: <Color>[
                Color.fromARGB(255, 191, 196, 213),
                Color.fromARGB(255, 185, 185, 217),
              ],
              stops: <double>[0.0, 1.0],
            ),
            borderRadius: BorderRadius.all(Radius.circular(40)),
            border: BoxBorder.all(
              color: const Color.fromARGB(255, 91, 93, 109),
              width: 1,
            ),
          ),
          child: Icon(
            Icons.play_arrow_rounded,
            size: 50,
            color: Color.fromARGB(255, 76, 80, 107),
          ),
        ),
      ),
    );
  }
}

enum _ButtonVariant { primary, outline, outline2, ghost, danger }

// ignore: must_be_immutable
class Button extends StatefulWidget {
  final IconData? icon;
  Widget? child;
  final VoidCallback? onTap;
  bool isSliding = false;
  final bool isDisabled;
  final _ButtonVariant _variant;

  Button({
    super.key,
    required this.child,
    this.icon,
    this.onTap,
    this.isSliding = false,
    this.isDisabled = false,
  }) : _variant = _ButtonVariant.primary;

  Button.outline({
    super.key,
    required this.child,
    this.icon,
    this.onTap,
    this.isSliding = false,
    this.isDisabled = false,
  }) : _variant = _ButtonVariant.outline;

  Button.ghost({
    super.key,
    required this.child,
    this.icon,
    this.onTap,
    this.isSliding = false,
    this.isDisabled = false,
  }) : _variant = _ButtonVariant.ghost;

  Button.danger({
    super.key,
    required this.child,
    this.icon,
    this.onTap,
    this.isSliding = false,
    this.isDisabled = false,
  }) : _variant = _ButtonVariant.danger;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnim;
  late final Animation<double> _glowAnim;

  bool _isPressed = false;

  // ── Design tokens ──────────────────────────
  static const _radius = BorderRadius.all(Radius.circular(14));

  Color get _bg {
    switch (widget._variant) {
      case _ButtonVariant.primary:
        return const Color(0xFFE8E0FF);
      case _ButtonVariant.outline:
      case _ButtonVariant.outline2:
        return const Color(0xFFE8E0FF);
      case _ButtonVariant.ghost:
        return Colors.transparent;
      case _ButtonVariant.danger:
        return const Color(0xFFFF3B30).withValues(alpha: 0.12);
    }
  }

  RadialGradient get _radGrad {
    return RadialGradient(
      center: Alignment(0, 0),
      radius: 0.15,
      colors: <Color>[
        Color.fromARGB(255, 191, 196, 213),
        Color.fromARGB(255, 185, 185, 217),
      ],
      stops: <double>[0.0, 1.0],
    );
  }

  Color get _fg {
    switch (widget._variant) {
      case _ButtonVariant.primary:
        return const Color(0xFF0D0D0F);
      case _ButtonVariant.outline:
      case _ButtonVariant.outline2:
        return const Color(0xFF0D0D0F);
      // return const Color(0xFFE8E0FF);
      case _ButtonVariant.ghost:
        return const Color(0xFF9D9DAA);
      case _ButtonVariant.danger:
        return const Color(0xFFFF3B30);
    }
  }

  Border? get _border {
    switch (widget._variant) {
      case _ButtonVariant.outline:
      case _ButtonVariant.outline2:
        return Border.all(
          color: const Color.fromARGB(255, 91, 93, 109),
          width: 1,
        );
      case _ButtonVariant.danger:
        return Border.all(
          color: const Color(0xFFFF3B30).withValues(alpha: 0.35),
          width: 1.5,
        );
      default:
        return null;
    }
  }

  Color get _glowColor {
    switch (widget._variant) {
      case _ButtonVariant.primary:
        return const Color(0xFFB39DFF).withValues(alpha: 0.35);
      case _ButtonVariant.danger:
        return const Color(0xFFFF3B30).withValues(alpha: 0.25);
      default:
        return Colors.transparent;
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
    );
    _scaleAnim = Tween<double>(
      begin: 1.0,
      end: 0.955,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _glowAnim = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(_) {
    if (widget.isDisabled) return;
    setState(() => _isPressed = true);
    _controller.forward();
  }

  void _onTapUp(_) {
    if (widget.isDisabled) return;
    setState(() => _isPressed = false);
    _controller.reverse();
    widget.onTap?.call();
  }

  void _onTapCancel() {
    if (widget.isDisabled) return;
    setState(() => _isPressed = false);
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final disabled = widget.isDisabled;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnim.value,
          child: GestureDetector(
            onTapDown: _onTapDown,
            onTapUp: _onTapUp,
            onTapCancel: _onTapCancel,
            child: AnimatedOpacity(
              opacity: disabled ? 0.38 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: Container(
                width: double.infinity,
                // height: 56,
                decoration: BoxDecoration(
                  // color: _bg,
                  borderRadius: _radius,
                  border: _border,
                  gradient: widget._variant == _ButtonVariant.outline2
                      ? null
                      : _radGrad,
                  boxShadow: widget._variant == _ButtonVariant.outline2
                      ? null
                      : [
                          // Ambient shadow
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.25),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                          // Glow on press
                          if (_glowColor != Colors.transparent)
                            BoxShadow(
                              color: _glowColor.withValues(
                                alpha: _glowColor.a * _glowAnim.value,
                              ),
                              blurRadius: 20,
                              spreadRadius: 2,
                            ),
                        ],
                ),
                child: ClipRRect(
                  borderRadius: _radius,
                  child: Stack(
                    children: [
                      // Shimmer overlay on press (primary only)
                      if (widget._variant == _ButtonVariant.primary)
                        Positioned.fill(
                          child: AnimatedOpacity(
                            opacity: _isPressed ? 0.08 : 0.0,
                            duration: const Duration(milliseconds: 80),
                            child: Container(color: Colors.white),
                          ),
                        ),

                      // Content
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (widget.isSliding) ...[
                              AnimatedSlide(
                                duration: const Duration(milliseconds: 200),
                                offset: _isPressed
                                    ? const Offset(0, 0)
                                    : Offset.zero,
                                child: widget.child,
                              ),
                            ] else
                              widget.child!,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
