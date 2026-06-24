import 'package:flutter/material.dart';

enum _ButtonVariant { primary, faded }

// ignore: must_be_immutable
class ButtonAnimated extends StatefulWidget {
  String label;
  final IconData? icon;
  final Widget? child;
  final VoidCallback? onTap;
  final bool isLoading;
  final bool isDisabled;
  final _ButtonVariant _variant;

  ButtonAnimated({
    super.key,
    required this.label,
    this.icon,
    this.child,
    this.onTap,
    this.isLoading = false,
    this.isDisabled = false,
  }) : _variant = _ButtonVariant.primary;

  ButtonAnimated.faded({
    super.key,
    required this.label,
    this.icon,
    this.child,
    this.onTap,
    this.isLoading = false,
    this.isDisabled = false,
  }) : _variant = _ButtonVariant.faded;

  @override
  State<ButtonAnimated> createState() => _ButtonAnimatedState();
}

class _ButtonAnimatedState extends State<ButtonAnimated>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnim;
  late final Animation<double> _glowAnim;

  bool _isPressed = false;

  static const _radius = BorderRadius.all(Radius.circular(14));

  Color get _bg {
    switch (widget._variant) {
      case _ButtonVariant.primary:
        return const Color(0xFFE8E0FF);
      case _ButtonVariant.faded:
        return const Color(0xFFE8E0FF);
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
        return Color.fromARGB(255, 76, 80, 107);
      case _ButtonVariant.faded:
        return Color.fromARGB(255, 76, 80, 107);
    }
  }

  Border? get _border {
    switch (widget._variant) {
      case _ButtonVariant.primary:
      case _ButtonVariant.faded:
        return Border.all(color: Color(0xFF8B8DBD), width: 1);
    }
  }

  Color get _glowColor {
    switch (widget._variant) {
      case _ButtonVariant.primary:
        return const Color(0xFFB39DFF).withValues(alpha: 0.35);
      case _ButtonVariant.faded:
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
    if (widget.isDisabled || widget.isLoading) return;
    setState(() => _isPressed = true);
    _controller.forward();
  }

  void _onTapUp(_) {
    if (widget.isDisabled || widget.isLoading) return;
    setState(() => _isPressed = false);
    _controller.reverse();
    widget.onTap?.call();
  }

  void _onTapCancel() {
    if (widget.isDisabled || widget.isLoading) return;
    setState(() => _isPressed = false);
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final disabled = widget.isDisabled || widget.isLoading;

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
                decoration: BoxDecoration(
                  borderRadius: _radius,
                  border: _border,
                ),
                child: ClipRRect(
                  borderRadius: _radius,
                  child: Stack(
                    children: [
                      if (widget._variant == _ButtonVariant.primary)
                        Positioned.fill(
                          child: AnimatedOpacity(
                            opacity: _isPressed ? 0.08 : 0.0,
                            duration: const Duration(milliseconds: 80),
                            child: Container(color: Colors.white),
                          ),
                        ),
                      Center(
                        child: widget.isLoading
                            ? _LoadingDots(color: _fg)
                            : Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (widget.child != null) ...[
                                    AnimatedSlide(
                                      duration: const Duration(
                                        milliseconds: 200,
                                      ),
                                      offset: _isPressed
                                          ? const Offset(0, 0)
                                          : Offset.zero,
                                      child: widget.child,
                                    ),
                                  ],
                                  if (widget.icon != null) ...[
                                    AnimatedSlide(
                                      duration: const Duration(
                                        milliseconds: 200,
                                      ),
                                      offset: _isPressed
                                          ? const Offset(0, 0)
                                          : Offset.zero,
                                      child: Icon(
                                        widget.icon,
                                        color: _fg,
                                        size: 18,
                                      ),
                                    ),
                                  ],
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

class _LoadingDots extends StatefulWidget {
  final Color color;
  const _LoadingDots({required this.color});

  @override
  State<_LoadingDots> createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<_LoadingDots>
    with TickerProviderStateMixin {
  final List<AnimationController> _controllers = [];
  final List<Animation<double>> _anims = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 3; i++) {
      final ctrl = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
      )..repeat(reverse: true, min: 0, max: 1);

      Future.delayed(Duration(milliseconds: i * 130), () {
        if (mounted) ctrl.forward();
      });

      _controllers.add(ctrl);
      _anims.add(
        Tween<double>(
          begin: 0.3,
          end: 1.0,
        ).animate(CurvedAnimation(parent: ctrl, curve: Curves.easeInOut)),
      );
    }
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (i) {
        return AnimatedBuilder(
          animation: _anims[i],
          builder: (_, __) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Opacity(
              opacity: _anims[i].value,
              child: Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: widget.color,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
