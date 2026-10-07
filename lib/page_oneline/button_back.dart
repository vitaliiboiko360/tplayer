import 'package:flutter/material.dart';
import 'package:tplayer/router/router.dart';

class ButtonBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    return Stack(
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
    );
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
