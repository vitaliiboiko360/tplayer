import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Round icon button with an embossed (raised) look that becomes
/// debossed (pressed in) while held. Suits the gear / speed buttons.
class ArrowButton extends StatefulWidget {
  ArrowButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.isDisabled = false,
    this.size = 40,
    this.baseColor = const Color(0xFF9b6bff),
    this.iconColor = const Color(0xFF10004A),
    this.tooltip,
  }) {
    if (isDisabled) {
      // baseColor = baseColor.withAlpha(16);
      iconColor = iconColor.withAlpha(16);
      // iconColor = Colors.white;
    }
  }

  final IconData icon;
  final VoidCallback onPressed;
  final bool isDisabled;
  final double size;
  Color baseColor;
  Color iconColor;
  final String? tooltip;

  @override
  State<ArrowButton> createState() => _ArrayButtonState();
}

class _ArrayButtonState extends State<ArrowButton> {
  bool _pressed = false;

  Color _shade(Color c, double amount) {
    final hsl = HSLColor.fromColor(c);
    return hsl
        .withLightness((hsl.lightness + amount).clamp(0.0, 1.0))
        .toColor();
  }

  @override
  Widget build(BuildContext context) {
    final light = _shade(widget.baseColor, 0.1);
    final dark = _shade(widget.baseColor, -0.3);
    final s = widget.size;
    final iconSize = s * 1.2;

    // Raised: light top-left -> dark bottom-right.
    // Pressed: reversed, so the surface looks pushed in.
    // final gradient = LinearGradient(
    //   begin: Alignment.topLeft,
    //   end: Alignment.bottomRight,
    //   colors: widget.isDisabled || _pressed
    //       ? [_shade(widget.baseColor, -0.08), _shade(widget.baseColor, 0.06)]
    //       : [_shade(widget.baseColor, 0.08), _shade(widget.baseColor, -0.06)],
    // );

    // final shadows = widget.isDisabled || _pressed
    //     ? <BoxShadow>[
    //         BoxShadow(
    //           color: dark.withAlpha(114),
    //           offset: const Offset(1, 1),
    //           blurRadius: 2,
    //         ),
    //       ]
    //     : <BoxShadow>[
    //         BoxShadow(
    //           color: dark.withAlpha(191),
    //           offset: Offset(s * 0.09, s * 0.09),
    //           blurRadius: s * 0.18,
    //         ),
    //         BoxShadow(
    //           color: light.withAlpha(242),
    //           offset: Offset(-s * 0.07, -s * 0.07),
    //           blurRadius: s * 0.14,
    //         ),
    //       ];

    return Semantics(
      button: true,
      label: widget.tooltip,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) => setState(() => _pressed = true),
        onTapCancel: () => setState(() => _pressed = false),
        onTapUp: (_) {
          setState(() => _pressed = false);
          HapticFeedback.selectionClick();
          widget.onPressed();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 110),
          curve: Curves.easeOut,
          width: s,
          height: s,
          // decoration: BoxDecoration(
          //   shape: BoxShape.circle,
          //   gradient: gradient,
          //   boxShadow: shadows,
          //   border: Border.all(
          //     color: _pressed ? dark.withOpacity(0.35) : light.withOpacity(0.6),
          //     width: 1.5,
          //   ),
          // ),
          child: Stack(
            children: [
              Positioned(
                left: -4,
                top: -4,
                child: _embossedIcon(light, dark, iconSize),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _embossedIcon(Color light, Color dark, double size) {
    final o = widget.isDisabled || _pressed ? 0.5 : 1.2;
    return Stack(
      fit: .passthrough,
      alignment: .center,
      children: [
        Transform.translate(
          offset: Offset(o, o),
          child: Icon(widget.icon, size: size, color: light.withAlpha(100)),
        ),
        Transform.translate(
          offset: Offset(-o, -o),
          child: Icon(widget.icon, size: size, color: dark.withAlpha(100)),
        ),
        Icon(
          widget.icon,
          size: size,
          color: widget.isDisabled
              ? widget.iconColor.withAlpha(32)
              : widget.iconColor.withAlpha(164),
        ),
      ],
    );
  }
}
