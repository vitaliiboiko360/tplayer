import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:tplayer/router/router.dart';

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
        SizedBox(height: 15),
        WordByWordButton(),
      ],
    );
  }
}

class OneLineButton extends StatelessWidget {
  @override
  Widget build(Object context) {
    return GestureDetector(
      onTap: () {
        router.go('/oneline');
      },
      child: Container(
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

class WordByWordButton extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Container(
      width: 220,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: BoxBorder.all(
          color: Color.fromARGB(255, 149, 134, 156).withAlpha(64),
          width: 1,
        ),
        shape: BoxShape.rectangle,
        gradient: RadialGradient(
          center: Alignment(0.6, -0.6),
          radius: 2.0,
          colors: <Color>[
            Color.fromARGB(255, 239, 239, 239),
            Color.fromARGB(255, 216, 207, 230),
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
                'Word by Word',
                style: TextStyle(
                  color: Color.fromARGB(255, 69, 74, 87),
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                    height: 10,
                    child: Image(
                      width: 10,
                      height: 10,
                      image: Svg(svgIconLeaf, size: Size(10, 10), source: .raw),
                    ),
                  ),
                  Text(
                    'First Steps for Begginers',
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

const svgIconLeaf =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" height="24px" width="24px" fill="#1f1f1f"><path d="M11,21V13.02q-1.6,0-3.07-0.61t-2.6-1.74T3.6,8.07T3,5V3H5Q6.58,3 8.05,3.61t2.6,1.74q0.78,0.78 1.29,1.7q0.51,0.92 0.79,1.97Q12.85,8.85 13,8.69q0.15-0.16 0.33-0.34q1.13-1.13 2.6-1.74T19,6h2V8q0,1.6-0.61,3.07t-1.74,2.6T16.06,15.4T13,16v5H11Zm0-10q0-1.2-0.46-2.29Q10.08,7.63 9.23,6.77Q8.38,5.93 7.29,5.46T5,5Q5,6.2 5.45,7.3t1.3,1.95t1.95,1.3T11,11Zm2,3q1.2,0 2.29-0.45t1.94-1.3t1.31-1.95T19,8q-1.2,0-2.3,0.46T14.75,9.77q-0.85,0.85-1.3,1.94T13,14Zm0,0Zm-2-3Z"/></svg>';
