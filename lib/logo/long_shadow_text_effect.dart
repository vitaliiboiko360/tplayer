import 'package:flutter/material.dart';

class LongShadowText extends StatelessWidget {
  final String text;
  const LongShadowText({super.key, required this.text});

  static List<Shadow> _buildLongShadow() {
    const steps = 4;
    const color = Color(0xFF2A0A5E);
    return List.generate(steps, (i) {
      final t = (i + 1).toDouble();
      return Shadow(
        color: color.withValues(alpha: (1 - i / steps) * 0.9),
        offset: Offset(t * 0.8, t * 0.8),
        blurRadius: 0,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: false,
      style: TextStyle(
        height: 1,
        fontSize: 34,
        fontWeight: FontWeight.w900,
        letterSpacing: -1,
        color: const Color.fromARGB(255, 176, 196, 255),
        shadows: _buildLongShadow(),
      ),
    );
  }
}
