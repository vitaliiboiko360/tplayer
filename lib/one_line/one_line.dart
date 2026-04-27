import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tplayer/home/home_buttons.dart';
import 'package:tplayer/home/home_slider.dart';
import 'package:tplayer/logo/logo_holder.dart';
import 'package:tplayer/ui/test_button.dart';

const double childHeight = 500;
const double childWidth = 350;

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
      body: SingleChildScrollView(
        child: OnePageLayoutParent(
          // SizedBox(height: 400)
          // child: Column(children: [TextBlock(), PlayerControls()]),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsetsGeometry.directional(top: 20, start: 20),
              child: FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.arrow_back, size: 25),
              ),
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

class OnePageLayoutParent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return CustomSingleChildLayout(
      delegate: OnePageLayoutChild(screenWidth, screenHeight),
      child: SizedBox(
        width: childWidth,
        height: childHeight,
        child: Column(children: [TextBlock(), PlayerControls()]),
      ),
    );
  }
}

class OnePageLayoutChild extends SingleChildLayoutDelegate {
  OnePageLayoutChild(this.width, this.height);
  double width;
  double height;

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(max(width, childWidth), max(height, childHeight));
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(max(0, (width / 2) - 175), max(0, (height / 2) - 250));
  }

  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    return true;
  }
}

class PlayerControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: childWidth,
      child: Column(
        children: [
          SizedBox(height: 20),
          Container(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                Align(alignment: Alignment.bottomLeft, child: ShowDetails()),
                Backward(),
                PlayPause(),
                Forward(),
                PlaybackSpeed(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PlayPause extends StatelessWidget {
  @override
  Widget build(Object context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, 0),
            radius: 0.15,
            colors: <Color>[
              Color.fromARGB(255, 191, 196, 213),
              Color.fromARGB(255, 185, 185, 217),
            ],
            stops: <double>[0.0, 1.0],
          ),
          borderRadius: BorderRadius.all(Radius.circular(40)),
          border: BoxBorder.all(
            color: const Color.fromARGB(255, 91, 93, 109),
            width: 1,
          ),
        ),
        child: Icon(
          Icons.play_arrow_rounded,
          size: 50,
          color: Color.fromARGB(255, 76, 80, 107),
        ),
      ),
    );
  }
}

class TextBlock extends StatelessWidget {
  BorderSide borderSide = BorderSide(
    color: Colors.blue, // Specify your desired color
    width: 1.0, // Specify your desired width
  );

  @override
  Widget build(Object context) {
    return Stack(
      children: [
        SizedBox(
          width: childWidth,
          height: 400,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border(left: borderSide, right: borderSide),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.directional(start: 15, end: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          '\t\t\tDeja que te cuente una historia sobre un pollito. Su nombre es Pollito Tito. Él vive en un gallinero pequeño y normal en un barrio pequeño y normal.',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Forward extends StatelessWidget {
  @override
  Widget build(Object context) {
    return SizedBox(
      width: 50,
      height: 40,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, 0),
            radius: 0.15,
            colors: <Color>[
              Color.fromARGB(255, 191, 196, 213),
              Color.fromARGB(255, 185, 185, 217),
            ],
            stops: <double>[0.0, 1.0],
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: BoxBorder.all(
            color: const Color.fromARGB(255, 91, 93, 109),
            width: 1,
          ),
        ),
        child: Icon(
          Icons.fast_forward_rounded,
          size: 20,
          color: Color.fromARGB(255, 76, 80, 107),
        ),
      ),
    );
  }
}

class Backward extends StatelessWidget {
  @override
  Widget build(Object context) {
    return SizedBox(
      width: 50,
      height: 40,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, 0),
            radius: 0.15,
            colors: <Color>[
              Color.fromARGB(255, 191, 196, 213),
              Color.fromARGB(255, 185, 185, 217),
            ],
            stops: <double>[0.0, 1.0],
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: BoxBorder.all(
            color: const Color.fromARGB(255, 91, 93, 109),
            width: 1,
          ),
        ),
        child: Icon(
          Icons.fast_rewind_rounded,
          size: 20,
          color: Color.fromARGB(255, 76, 80, 107),
        ),
      ),
    );
  }
}

class PlaybackSpeed extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsetsGeometry.directional(start: 8),
        child: SizedBox(
          width: 50,
          height: 40,
          child: DecoratedBox(
            decoration: BoxDecoration(
              // gradient: RadialGradient(
              //   center: Alignment(0, 0),
              //   radius: 0.15,
              //   colors: <Color>[
              //     Color.fromARGB(255, 191, 196, 213),
              //     Color.fromARGB(255, 185, 185, 217),
              //   ],
              //   stops: <double>[0.0, 1.0],
              // ),
              // borderRadius: BorderRadius.all(Radius.circular(40)),
              // border: BoxBorder.all(
              //   color: const Color.fromARGB(255, 91, 93, 109),
              //   width: 1,
              // ),
            ),
            child: Text(
              '0.85x',
              style: TextStyle(
                color: const Color.fromARGB(255, 87, 87, 87),
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ShowDetails_1 extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsetsGeometry.only(left: 8),
        child: SizedBox(
          width: 50,
          height: 30,
          child: DecoratedBox(
            decoration: BoxDecoration(
              // gradient: RadialGradient(
              //   center: Alignment(0, 0),
              //   radius: 0.15,
              //   colors: <Color>[
              //     Color.fromARGB(255, 213, 226, 227),
              //     Color.fromARGB(255, 181, 199, 196),
              //   ],
              //   stops: <double>[0.0, 1.0],
              // ),
              borderRadius: BorderRadius.all(Radius.circular(40)),
              // border: BoxBorder.all(
              //   color: const Color.fromARGB(255, 234, 244, 247),
              //   width: 1,
              // ),
            ),
            child: Icon(
              Icons.pending_rounded,
              size: 30,
              color: const Color.fromARGB(255, 145, 151, 165),
            ),
          ),
        ),
      ),
    );
  }
}

class ShowDetails extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsetsGeometry.zero,
        child: SizedBox(
          width: 50,
          height: 30,
          child: TestButton(label: '', icon: Icons.pending_rounded),
        ),
      ),
    );
  }
}
