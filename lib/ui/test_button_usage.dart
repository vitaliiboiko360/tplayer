import 'package:flutter/material.dart';
import 'package:tplayer/ui/test_button.dart';

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
