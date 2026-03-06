import 'package:flutter/material.dart';
import 'package:tplayer/home/home.dart';

class HomeButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        OneLineButton(),
        SizedBox(height: 15),
        ShortStoriesButton(),
      ],
    );
  }
}

class OneLineButton extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Container(
      width: 220,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: BoxBorder.all(
          color: Color.fromARGB(255, 66, 80, 83).withAlpha(64),
          width: 1,
        ),
        shape: BoxShape.rectangle,
        gradient: RadialGradient(
          center: Alignment(-0.6, -0.6),
          radius: 2.0,
          colors: <Color>[
            Color.fromARGB(255, 238, 238, 238),
            Color.fromARGB(255, 158, 194, 204),
          ],
          stops: <double>[0.1, 1.0],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(96), // Shadow color and opacity
            offset: Offset(3, 3), // X and Y displacement
            blurRadius: 7, // How soft the edges are
            spreadRadius: 1, // How much the shadow expands
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: EdgeInsetsGeometry.only(left: 20, bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'One Lines',
                style: TextStyle(
                  color: Color.fromARGB(255, 66, 80, 83),
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.star, size: 10),
                  Text(
                    'Recomended',
                    style: TextStyle(
                      color: Color.fromARGB(255, 66, 80, 83),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShortStoriesButton extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Container(
      width: 220,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: BoxBorder.all(
          color: Color.fromARGB(255, 66, 80, 83).withAlpha(64),
          width: 1,
        ),
        shape: BoxShape.rectangle,
        gradient: RadialGradient(
          center: Alignment(-0.6, 0.6),
          radius: 2.0,
          colors: <Color>[
            Color.fromARGB(255, 238, 238, 238),
            Color.fromARGB(255, 158, 171, 204),
          ],
          stops: <double>[0.1, 1.0],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(96), // Shadow color and opacity
            offset: Offset(3, 3), // X and Y displacement
            blurRadius: 7, // How soft the edges are
            spreadRadius: 1, // How much the shadow expands
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: EdgeInsetsGeometry.only(left: 20, bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Short Stories',
                style: TextStyle(
                  color: Color.fromARGB(255, 69, 74, 87),
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.diamond, size: 10),
                  Text(
                    'For Advanced Learner',
                    style: TextStyle(
                      color: Color.fromARGB(255, 69, 74, 87),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
