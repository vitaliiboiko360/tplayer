import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tplayer/page_oneline/player_controls.dart';
import 'package:tplayer/page_oneline/text_block.dart';
import 'package:tplayer/page_oneline/button_back.dart';

const double TextBlockHeight = 510;
const double TextBlockWidth = 350;

class OneLinePage extends StatefulWidget {
  const OneLinePage({super.key});

  final String title = 'Text Player';

  @override
  State<OneLinePage> createState() => _OneLinePageState();
}

class _OneLinePageState extends State<OneLinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: OneLinePageLayoutParent()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonBack(),
    );
  }
}

class OneLinePageLayoutParent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return CustomSingleChildLayout(
      delegate: OneLinePageLayoutChild(screenWidth, screenHeight),
      child: SizedBox(
        width: TextBlockWidth,
        height: TextBlockHeight,
        child: Column(children: [TextBlock(), PlayerControls()]),
      ),
    );
  }
}

class OneLinePageLayoutChild extends SingleChildLayoutDelegate {
  OneLinePageLayoutChild(this.screenWidth, this.screenHeight);
  double screenWidth;
  double screenHeight;

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(
      max(screenWidth, TextBlockWidth),
      max(screenHeight, TextBlockHeight),
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
