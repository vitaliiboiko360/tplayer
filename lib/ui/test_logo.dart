import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(const TextShadowApp());

class TextShadowApp extends StatelessWidget {
  const TextShadowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Text Shadow Typography',
      debugShowCheckedModeBanner: false,
      home: TextShadowShowcase(),
    );
  }
}

// ─────────────────────────────────────────────
// SHOWCASE PAGE
// ─────────────────────────────────────────────
class TextShadowShowcase extends StatelessWidget {
  const TextShadowShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0E),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const Text(
                'Typography\nEffects',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF444450),
                  letterSpacing: 3,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 48),

              // ── 1. SOFT DEPTH ──────────────────
              _ShadowCard(
                label: 'Soft Depth',
                background: const Color(0xFF0F0F18),
                child: const SoftDepthText(text: 'Light Touch'),
              ),
              const SizedBox(height: 20),

              // ── 2. NEON GLOW ───────────────────
              _ShadowCard(
                label: 'Neon Glow',
                background: const Color(0xFF06060D),
                child: const NeonGlowText(text: 'Night Drive'),
              ),
              const SizedBox(height: 20),

              // ── 3. LONG SHADOW ─────────────────
              _ShadowCard(
                label: 'Long Shadow',
                background: const Color(0xFF1A0F2E),
                child: const LongShadowText(text: 'Bold Move'),
              ),
              const SizedBox(height: 20),

              // ── 4. CHROMATIC ABERRATION ────────
              _ShadowCard(
                label: 'Chromatic Aberration',
                background: const Color(0xFF080808),
                child: const ChromaticText(text: 'Glitch Era'),
              ),
              const SizedBox(height: 20),

              // ── 5. EMBOSSED ────────────────────
              _ShadowCard(
                label: 'Embossed',
                background: const Color(0xFF1C1C24),
                child: const EmbossedText(text: 'Carved In'),
              ),
              const SizedBox(height: 20),

              // ── 6. LAYERED STACK ───────────────
              _ShadowCard(
                label: 'Layered Stack',
                background: const Color(0xFF0D1117),
                child: const LayeredStackText(text: 'Deep Cut'),
              ),
              const SizedBox(height: 20),

              // ── 7. GOLD LUXURY ─────────────────
              _ShadowCard(
                label: 'Gold Luxury',
                background: const Color(0xFF0C0906),
                child: const GoldLuxuryText(text: 'Prestige'),
              ),

              const SizedBox(height: 48),
              const Center(
                child: Text(
                  'Flutter Text Shadow Showcase',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF2A2A32),
                    letterSpacing: 2,
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
// CARD WRAPPER
// ─────────────────────────────────────────────
class _ShadowCard extends StatelessWidget {
  final String label;
  final Color background;
  final Widget child;

  const _ShadowCard({
    required this.label,
    required this.background,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            fontSize: 10,
            color: Color(0xFF444450),
            letterSpacing: 2.5,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.05),
              width: 1,
            ),
          ),
          child: Center(child: child),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// 1. SOFT DEPTH — layered soft shadows for a
//    gentle three-dimensional lift
// ─────────────────────────────────────────────
class SoftDepthText extends StatelessWidget {
  final String text;
  const SoftDepthText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.w200,
        letterSpacing: -1.5,
        color: const Color(0xFFE8E4FF),
        shadows: [
          Shadow(
            color: const Color(0xFF6B5CE7).withValues(alpha: 0.6),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
          Shadow(
            color: const Color(0xFF6B5CE7).withValues(alpha: 0.3),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
          Shadow(
            color: const Color(0xFF6B5CE7).withValues(alpha: 0.1),
            blurRadius: 48,
            offset: const Offset(0, 24),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 2. NEON GLOW — pulsing electric aura around
//    razor-thin glowing letterforms
// ─────────────────────────────────────────────
class NeonGlowText extends StatefulWidget {
  final String text;
  const NeonGlowText({super.key, required this.text});

  @override
  State<NeonGlowText> createState() => _NeonGlowTextState();
}

class _NeonGlowTextState extends State<NeonGlowText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _pulse;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..repeat(reverse: true);
    _pulse = Tween<double>(
      begin: 0.7,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pulse,
      builder: (_, __) => Text(
        widget.text,
        style: TextStyle(
          fontSize: 44,
          fontWeight: FontWeight.w700,
          letterSpacing: 4,
          color: const Color(0xFF00FFB2),
          shadows: [
            // Tight core glow
            Shadow(
              color: const Color(0xFF00FFB2).withValues(alpha: _pulse.value),
              blurRadius: 4,
              offset: Offset.zero,
            ),
            // Mid aura
            Shadow(
              color: const Color(
                0xFF00FFB2,
              ).withValues(alpha: _pulse.value * 0.6),
              blurRadius: 16,
              offset: Offset.zero,
            ),
            // Wide halo
            Shadow(
              color: const Color(
                0xFF00FFB2,
              ).withValues(alpha: _pulse.value * 0.3),
              blurRadius: 40,
              offset: Offset.zero,
            ),
            // Colour bleed
            Shadow(
              color: const Color(
                0xFF0066FF,
              ).withValues(alpha: _pulse.value * 0.2),
              blurRadius: 60,
              offset: const Offset(0, 2),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 3. LONG SHADOW — geometric diagonal shadow
//    built from stacked 1px offsets
// ─────────────────────────────────────────────
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
      style: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w900,
        letterSpacing: -1,
        color: const Color(0xFFCFB0FF),
        shadows: _buildLongShadow(),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 4. CHROMATIC ABERRATION — RGB channel split
//    with animated drift
// ─────────────────────────────────────────────
class ChromaticText extends StatefulWidget {
  final String text;
  const ChromaticText({super.key, required this.text});

  @override
  State<ChromaticText> createState() => _ChromaticTextState();
}

class _ChromaticTextState extends State<ChromaticText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _drift;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat(reverse: true);
    _drift = Tween<double>(
      begin: 0.6,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _drift,
      builder: (_, __) {
        final d = _drift.value * 3.0;
        return Text(
          widget.text,
          style: TextStyle(
            fontSize: 46,
            fontWeight: FontWeight.w800,
            letterSpacing: 1,
            color: Colors.white,
            shadows: [
              // Cyan channel left
              Shadow(
                color: const Color(0xFF00FFFF).withValues(alpha: 0.75),
                offset: Offset(-d, 0),
                blurRadius: 0,
              ),
              // Magenta channel right
              Shadow(
                color: const Color(0xFFFF00FF).withValues(alpha: 0.75),
                offset: Offset(d, 0),
                blurRadius: 0,
              ),
              // Red channel up
              Shadow(
                color: const Color(0xFFFF0033).withValues(alpha: 0.35),
                offset: Offset(0, -d * 0.5),
                blurRadius: 0,
              ),
            ],
          ),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────
// 5. EMBOSSED — light source from top-left
//    creating a pressed-into-surface effect
// ─────────────────────────────────────────────
class EmbossedText extends StatelessWidget {
  final String text;
  const EmbossedText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 44,
        fontWeight: FontWeight.w900,
        letterSpacing: -1,
        color: Color(0xFF2A2A38),
        shadows: [
          // Dark shadow — bottom-right (recession)
          Shadow(color: Color(0xFF0A0A12), offset: Offset(3, 3), blurRadius: 4),
          // Light highlight — top-left (raised edge)
          Shadow(
            color: Color(0xFF5A5A72),
            offset: Offset(-2, -2),
            blurRadius: 3,
          ),
          // Subtle ambient fill
          Shadow(color: Color(0xFF1E1E28), offset: Offset(1, 1), blurRadius: 8),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 6. LAYERED STACK — hard-offset stacked copies
//    for a risograph / screen-print look
// ─────────────────────────────────────────────
class LayeredStackText extends StatelessWidget {
  final String text;
  const LayeredStackText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    const baseStyle = TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.w900,
      letterSpacing: -2,
    );

    return Stack(
      children: [
        // Layer 3 — cyan, furthest
        Text(
          text,
          style: baseStyle.copyWith(
            color: const Color(0xFF00D4FF).withValues(alpha: 0.6),
            shadows: const [
              Shadow(
                color: Color(0xFF00D4FF),
                offset: Offset(6, 6),
                blurRadius: 0,
              ),
            ],
          ),
        ),
        // Layer 2 — magenta, middle
        Transform.translate(
          offset: const Offset(-3, -3),
          child: Text(
            text,
            style: baseStyle.copyWith(
              color: const Color(0xFFFF2D78).withValues(alpha: 0.6),
            ),
          ),
        ),
        // Layer 1 — white, top
        Transform.translate(
          offset: const Offset(-6, -6),
          child: Text(text, style: baseStyle.copyWith(color: Colors.white)),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// 7. GOLD LUXURY — warm metallic shimmer with
//    deep amber shadow and inner glow
// ─────────────────────────────────────────────
class GoldLuxuryText extends StatefulWidget {
  final String text;
  const GoldLuxuryText({super.key, required this.text});

  @override
  State<GoldLuxuryText> createState() => _GoldLuxuryTextState();
}

class _GoldLuxuryTextState extends State<GoldLuxuryText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _shimmer;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3500),
    )..repeat(reverse: true);
    _shimmer = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _shimmer,
      builder: (_, __) => ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (bounds) => LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFFFF0A0),
            const Color(0xFFE8B84B),
            const Color(0xFFFFF8D0),
            const Color(0xFFB8860B),
            const Color(0xFFFFD700),
          ],
          stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
        ).createShader(bounds),
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w700,
            letterSpacing: 6,
            color: Colors.white,
            shadows: [
              Shadow(
                color: const Color(
                  0xFFFFAA00,
                ).withValues(alpha: _shimmer.value * 0.8),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
              Shadow(
                color: const Color(
                  0xFF8B5E00,
                ).withValues(alpha: _shimmer.value * 0.9),
                blurRadius: 3,
                offset: const Offset(2, 3),
              ),
              Shadow(
                color: const Color(
                  0xFFFFDD00,
                ).withValues(alpha: _shimmer.value * 0.4),
                blurRadius: 30,
                offset: Offset.zero,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
