import 'package:flutter/material.dart';
import 'package:tplayer/one_line/one_line.dart';

const String testString =
    'Deja que te cuente una historia sobre un pollito. Su nombre es Pollito Tito. Él vive en un gallinero pequeño y normal en un barrio pequeño y normal.';

class TextBlock extends StatelessWidget {
  BorderSide borderSide = BorderSide(color: Colors.blue, width: 1.0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: TextBlockWidth,
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
                  child: getTextLines(
                    testString,
                    DefaultTextStyle.of(context).style,
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

const firstWordLineIndentation = '\t\t';
const sumOfLeftRightPadding = 25;

Size _textSize(String text, TextStyle style) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    maxLines: 1,
    textDirection: TextDirection.ltr,
  )..layout(minWidth: 0, maxWidth: double.infinity);
  return textPainter.size;
}

Widget getTextLines(String inputString, TextStyle style) {
  List<String> words = inputString.split(' ');

  var currentLineLength = 0;
  String currentLine = '';

  List<Widget> lines = [];

  for (var i = 0; i < words.length; i++) {
    String word = words[i];
    var wordWidth = _textSize(word, style).width.ceil();

    if (i == 0) {
      currentLineLength += _textSize(
        firstWordLineIndentation,
        style,
      ).width.ceil();
      currentLine += firstWordLineIndentation;
    }

    if (currentLineLength + wordWidth >
        TextBlockWidth - sumOfLeftRightPadding) {
      lines.add(new Row(children: [Text(currentLine)]));
      currentLine = word;
      currentLineLength = wordWidth;
    } else {
      currentLine += ' ';
      currentLine += word;
      currentLineLength += _textSize(' ', style).width.ceil();
      currentLineLength += wordWidth;
    }
  }
  lines.add(new Row(children: [Text(currentLine)]));

  return Column(children: lines);
}
