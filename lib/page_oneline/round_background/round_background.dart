import 'package:flutter/material.dart';
import 'package:tplayer/page_oneline/page_oneline.dart';

const mainBackground = Color(0xFFfffdf7);

const double radiusForBlock = 30;

class RoundBackground extends StatefulWidget {
  const RoundBackground({
    super.key,
    required this.child,
    required this.width,
    this.height = PageOnelineHeight,
    this.color = mainBackground,
    this.shadowColor = const Color(0x2E000000),
  });

  final Widget child;
  final double height;
  final Color color;
  final Color shadowColor;
  final double width;

  @override
  State<RoundBackground> createState() => _RoundBackgroundState();
}

class _RoundBackgroundState extends State<RoundBackground> {
  @override
  Widget build(BuildContext context) {
    final double depth = 7; // height of the 3D edge

    return SizedBox(
      width: widget.width,
      height: widget.height + depth,
      child: Stack(
        children: [
          // Bottom edge (the 3D "thickness") plus soft drop shadow
          Positioned(
            top: depth,
            left: 0,
            right: 0,
            child: Container(
              height: widget.height,
              width: TextBlockWidth,
              decoration: BoxDecoration(
                color: widget.shadowColor,
                shape: BoxShape.rectangle,
                borderRadius: .directional(
                  bottomStart: .circular(radiusForBlock),
                  bottomEnd: .circular(radiusForBlock),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x40000000),
                    blurRadius: radiusForBlock,
                    offset: Offset(0, radiusForBlock / 2),
                  ),
                ],
              ),
            ),
          ),
          // Top face, slides down when pressed
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: TextBlockWidth,
              height: widget.height,
              decoration: BoxDecoration(
                color: widget.color,
                shape: BoxShape.rectangle,
                borderRadius: .directional(
                  bottomStart: .circular(radiusForBlock),
                  bottomEnd: .circular(radiusForBlock),
                ),
              ),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}
