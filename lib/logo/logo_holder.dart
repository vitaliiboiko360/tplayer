import 'package:flutter/material.dart';
import 'package:tplayer/ui/test_logo.dart';

class LogoHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 360,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Image.asset('img/logo.png', width: 120, height: 120),
          Positioned(
            left: 80,
            top: 55,
            child: Align(
              child: SizedBox(
                width: 250,
                height: 60,
                child: FittedBox(
                  fit: BoxFit
                      .scaleDown, // Scales down only if it exceeds the box
                  child: LongShadowText(text: 'Language Shadowing'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//, width: 120, height: 120
