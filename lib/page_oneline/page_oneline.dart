import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tplayer/page_oneline/round_background/round_background.dart';
import 'package:tplayer/page_oneline/player_controls/player_controls.dart';
import 'package:tplayer/page_oneline/text_block/text_block.dart';
import 'package:tplayer/page_oneline/ui_elements/button_back.dart';

const double PageOnelineHeight = 670;
const double TextBlockWidth = 350;

class PageOneLine extends StatefulWidget {
  const PageOneLine({super.key});

  final String title = 'Text Player';

  @override
  State<PageOneLine> createState() => _PageOneLineState();
}

class _PageOneLineState extends State<PageOneLine> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: .topCenter,
          end: .bottomCenter,
          transform: GradientRotation(2.79),
          colors: [Color(0xFF9b6bff), Color(0xFF5b8cff)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SingleChildScrollView(
            scrollDirection: .horizontal,
            child: PageOneLineLayoutParent(),
          ),
        ),
        floatingActionButtonLocation: .centerDocked,
        floatingActionButton: ButtonBack(),
      ),
    );
  }
}

class PageOneLineLayoutParent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return CustomSingleChildLayout(
      delegate: PageOneLineLayoutChild(screenWidth, screenHeight),
      child: SizedBox(
        width: TextBlockWidth,
        height: PageOnelineHeight,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 105, 251, 98),
              width: 1.0,
            ),
          ),
          child: Column(children: [TextBlock(), PlayerControls()]),
        ),
      ),
      // child: RoundBackground(
      //   width: TextBlockWidth,
      //   height: PageOnelineHeight,
      //   child: Column(children: [TextBlock(), PlayerControls()]),
      // ),
    );
  }
}

class PageOneLineLayoutChild extends SingleChildLayoutDelegate {
  PageOneLineLayoutChild(this.screenWidth, this.screenHeight);
  double screenWidth;
  double screenHeight;

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(
      max(screenWidth, TextBlockWidth),
      max(screenHeight, PageOnelineHeight),
    );
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(
      max(0, (screenWidth / 2) - 175),
      max(0, (screenHeight / 2) - 250),
    );
  }

  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    return true;
  }
}
