import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tplayer/one_line/player_controls.dart';
import 'package:tplayer/one_line/text_block.dart';
import 'package:tplayer/router/router.dart';

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
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    return Scaffold(
      body: SingleChildScrollView(child: OneLinePageLayoutParent()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsetsGeometry.directional(top: 20, start: 20),
              child: BackButton(),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              '${screenWidth.toStringAsFixed(0)} x ${screenHeight.toStringAsFixed(0)} : ${devicePixelRatio.toStringAsFixed(2)}',
            ),
          ),
        ],
      ),
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
        child: Column(children: [
          TextBlock(),
          PlayerControls(),
        ]),
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

class BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        router.go('/');
      },
      foregroundColor: Color.fromARGB(255, 19, 87, 189),
      backgroundColor: Color.fromARGB(255, 206, 220, 251),
      child: Icon(Icons.arrow_back, size: 25),
    );
  }
}
