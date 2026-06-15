import 'package:flutter/material.dart';
import 'package:tplayer/one_line/one_line.dart';

const String testString =
    'Deja que te cuente una historia sobre un pollito. Su nombre es Pollito Tito. Él vive en un gallinero pequeño y normal en un barrio pequeño y normal.';

class TextBlock extends StatefulWidget {
  @override
  State<TextBlock> createState() => TextBlockState();
}

class TextBlockState extends State<TextBlock> with TickerProviderStateMixin {
  BorderSide borderSide = BorderSide(color: Colors.blue, width: 1.0);

  late AnimationController _controller;
  List<Animation<double>> _animations = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
  }

  Future<void> _playAnimation() async {
    print('play animation called');
    try {
      await _controller.forward().orCancel;
      // await _controller.reverse().orCancel;
    } on TickerCanceled {
      // The animation got canceled, probably because it was disposed of.
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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

  Widget getTextLines(String inputString, TextStyle style) {
    List<String> words = inputString.split(' ');

    var currentLineLength = 0;
    var firstLineLengthNoIndent = 0;
    String currentLine = '';
    List<int> lineLengths = [];
    List<String> lineTexts = [];
    List<Widget> lines = [];

    for (var i = 0; i < words.length; i++) {
      String word = words[i];
      var wordWidth = _textSize(word, style).width.ceil();

      if (i == 0) {
        currentLineLength += _textSize(
          firstWordLineIndentation,
          style,
        ).width.ceil();
      }

      if (currentLineLength + wordWidth >
          TextBlockWidth - sumOfLeftRightPadding) {
        lineTexts.add(currentLine);
        lineLengths.add(currentLineLength);
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
    lineTexts.add(currentLine);
    lineLengths.add(currentLineLength);

    final lineLengthsSum = lineLengths.reduce((a, b) => a + b);

    double intervalStart = 0;
    for (var i = 0; i < lineLengths.length; i++) {
      var lineLength = lineLengths[i];
      var lineInterval = lineLength / lineLengthsSum;

      print(
        'interval start:$intervalStart end:${intervalStart + lineInterval}',
      );

      _animations.add(
        Tween<double>(begin: 0, end: lineLength.toDouble()).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(
              intervalStart,
              intervalStart + lineInterval,
              curve: Curves.linear,
            ),
          ),
        ),
      );

      intervalStart = intervalStart + lineInterval;
    }

    for (var i = 0; i < lineTexts.length; i++) {
      var currentLine = lineTexts[i];
      lines.add(
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            _playAnimation();
          },
          child: getTextLine(
            currentLine,
            _animations[i].value,
            addIndentation: i == 0,
          ),
        ),
      );
    }

    return Column(children: lines);
  }

  Widget getTextLine(
    String inputString,
    double lineWidth, {
    addIndentation = false,
  }) {
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

Widget hLine(double width) =>
    Row(children: [CustomPaint(painter: HLinePainter(width))]);

class HLinePainter extends CustomPainter {
  HLinePainter(this.width);
  double width;
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & Size(width, 2);
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
