import 'package:flutter/material.dart';
import 'package:tplayer/one_line/one_line.dart';

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
          width: ChildWidth,
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
