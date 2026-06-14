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

const firstWordLineIndentation = '\u00A0\u00A0\u00A0';
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
  var firstLineLengthNoIndent = 0;
  String currentLine = '';

  List<Widget> lines = [];

  bool isFirstLine = true;
  for (var i = 0; i < words.length; i++) {
    String word = words[i];
    var wordWidth = _textSize(word, style).width.ceil();

    if (i == 0) {
      currentLineLength += _textSize(
        firstWordLineIndentation,
        style,
      ).width.ceil();
      // currentLine += firstWordLineIndentation;
    }

    if (currentLineLength + wordWidth >
        TextBlockWidth - sumOfLeftRightPadding) {
      lines.add(getTextLine(currentLine, style, addIndentation: isFirstLine));

      if (isFirstLine) {
        isFirstLine = false;
      }

      currentLine = word;
      currentLineLength = wordWidth;
    } else {
      currentLine += ' ';
      currentLine += word;
      currentLineLength += _textSize(' ', style).width.ceil();
      currentLineLength += wordWidth;
      firstLineLengthNoIndent += wordWidth;
    }
  }

  lines.add(getTextLine(currentLine, style));

  return Column(children: lines);
}

Widget getTextLine(
  String inputString,
  TextStyle style, {
  bool addIndentation = false,
}) {
  final lineWidth = _textSize(inputString, style).width.ceil().toDouble();
  if (addIndentation) {
    return Row(
      spacing: 0,
      children: [
        Text(
          firstWordLineIndentation,
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(inputString), hLine(lineWidth)],
        ),
      ],
    );
  }

  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(inputString), hLine(lineWidth)],
      ),
    ],
  );
}

Widget hLine(double width) =>
    Row(children: [CustomPaint(painter: HLinePainter(width))]);

class HLinePainter extends CustomPainter {
  HLinePainter(this.width);
  double? width;
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & Size(width!, 2);
    const RadialGradient gradient = RadialGradient(
      center: Alignment(0.7, -0.6),
      radius: 10,
      colors: <Color>[
        Color(0xFF0099FF),
        Color(0xFF0099FF),
      ], // Color(0xFFFFFF00),
      stops: <double>[0.4, 1.0],
    );
    canvas.drawRect(rect, Paint()..shader = gradient.createShader(rect));
  }

  @override
  bool shouldRepaint(HLinePainter oldDelegate) => false;
}
