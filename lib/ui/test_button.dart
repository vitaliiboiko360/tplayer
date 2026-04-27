import 'package:flutter/material.dart';

/// A collection of stylish, animated button widgets.
/// Usage:
///   TestButton(label: 'Get Started', onTap: () {})
///   TestButton.outline(label: 'Learn More', onTap: () {})
///   TestButton.ghost(label: 'Cancel', onTap: () {})
///   TestButton.danger(label: 'Delete', onTap: () {})

void main() => runApp(const ButtonShowcaseApp());

// ─────────────────────────────────────────────
// SHOWCASE APP
// ─────────────────────────────────────────────
class ButtonShowcaseApp extends StatelessWidget {
  const ButtonShowcaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stylish Buttons',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0D0D0F),
      ),
      home: const ButtonShowcasePage(),
    );
  }
}

class ButtonShowcasePage extends StatelessWidget {
  const ButtonShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Button\nComponents',
                style: TextStyle(
                  fontFamily: 'serif',
                  fontSize: 42,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFFF5F5F0),
                  height: 1.1,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Tap each to feel the interaction.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF777780),
                  letterSpacing: 0.3,
                ),
              ),
              const SizedBox(height: 56),

              // Primary
              TestButton(
                label: 'Get Started',
                icon: Icons.arrow_forward_rounded,
                onTap: () {},
              ),
              const SizedBox(height: 16),

              // Outline
              TestButton.outline(
                label: 'Learn More',
                icon: Icons.info_outline_rounded,
                onTap: () {},
              ),
              const SizedBox(height: 16),

              // Ghost
              TestButton.ghost(label: 'Maybe Later', onTap: () {}),
              const SizedBox(height: 16),

              // Danger
              TestButton.danger(
                label: 'Delete Account',
                icon: Icons.delete_outline_rounded,
                onTap: () {},
              ),
              const SizedBox(height: 16),

              // Loading state
              TestButton(label: 'Processing...', isLoading: true, onTap: () {}),
              const SizedBox(height: 16),

              // Disabled
              TestButton(label: 'Unavailable', isDisabled: true, onTap: () {}),

              const Spacer(),
              Center(
                child: Text(
                  'TestButton — Flutter Widget',
                  style: TextStyle(
                    fontSize: 12,
                    color: const Color(0xFF777780).withValues(alpha: 0.5),
                    letterSpacing: 1.2,
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

// ─────────────────────────────────────────────
// STYLISH BUTTON WIDGET
// ─────────────────────────────────────────────

enum _ButtonVariant { primary, outline, ghost, danger }

class TestButton extends StatefulWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onTap;
  final bool isLoading;
  final bool isDisabled;
  final _ButtonVariant _variant;

  const TestButton({
    super.key,
    required this.label,
    this.icon,
    this.onTap,
    this.isLoading = false,
    this.isDisabled = false,
  }) : _variant = _ButtonVariant.primary;

  const TestButton.outline({
    super.key,
    required this.label,
    this.icon,
    this.onTap,
    this.isLoading = false,
    this.isDisabled = false,
  }) : _variant = _ButtonVariant.outline;

  const TestButton.ghost({
    super.key,
    required this.label,
    this.icon,
    this.onTap,
    this.isLoading = false,
    this.isDisabled = false,
  }) : _variant = _ButtonVariant.ghost;

  const TestButton.danger({
    super.key,
    required this.label,
    this.icon,
    this.onTap,
    this.isLoading = false,
    this.isDisabled = false,
  }) : _variant = _ButtonVariant.danger;

  @override
  State<TestButton> createState() => _TestButtonState();
}

class _TestButtonState extends State<TestButton>
    with SingleTickerProviderStateMixin {
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
      case _ButtonVariant.ghost:
        return Colors.transparent;
      case _ButtonVariant.danger:
        return const Color(0xFFFF3B30).withOpacity(0.12);
    }
  }

  Color get _fg {
    switch (widget._variant) {
      case _ButtonVariant.primary:
        return const Color(0xFF0D0D0F);
      case _ButtonVariant.outline:
        return const Color(0xFFE8E0FF);
      case _ButtonVariant.ghost:
        return const Color(0xFF9D9DAA);
      case _ButtonVariant.danger:
        return const Color(0xFFFF3B30);
    }
  }

  Border? get _border {
    switch (widget._variant) {
      case _ButtonVariant.outline:
        return Border.all(color: const Color(0xFF3A3A4A), width: 1.5);
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
                height: 56,
                decoration: BoxDecoration(
                  color: _bg,
                  borderRadius: _radius,
                  border: _border,
                  boxShadow: [
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
                        child: widget.isLoading
                            ? _LoadingDots(color: _fg)
                            : Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Text(
                                  //   widget.label,
                                  //   style: TextStyle(
                                  //     color: _fg,
                                  //     fontSize: 15,
                                  //     fontWeight: FontWeight.w600,
                                  //     letterSpacing: 0.2,
                                  //   ),
                                  // ),
                                  if (widget.icon != null) ...[
                                    // const SizedBox(width: 8),
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

// ─────────────────────────────────────────────
// ANIMATED LOADING DOTS
// ─────────────────────────────────────────────

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
