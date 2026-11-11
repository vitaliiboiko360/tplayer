import 'package:flutter/material.dart';
import 'package:tplayer/page_text/page_text.dart';
import 'package:tplayer/page_text/text_line/text_line.dart';

class TextLine extends StatelessWidget {
  TextLine({super.key, required this.line});
  final String line;
  List<Word> words = [];

  onClick() {
    words[0].start();
    for (var i = 0; i < words.length; i++) {
      if (i + 1 < words.length) {
        words[i].onComplete(() => words[i + 1].start());
      } else {
        words[i].onComplete(() {
          resetAnimation();
        });
      }
    }
  }

  resetAnimation() {
    for (var i = 0; i < words.length; i++) {
      words[i].wordState.controller.reset();
    }
  }

  @override
  Widget build(Object context) {
    words = [];
    return GestureDetector(
      onTap: onClick,
      child: Wrap(
        spacing: 0,
        runSpacing: 0,
        children: [
          ...line.split(' ').map((w) {
            var widget = Word(word: '$w ');
            words.add(widget);
            return widget;
          }),
        ],
      ),
    );
  }
}

class Word extends StatefulWidget {
  Word({super.key, required this.word});
  final String word;
  WordState wordState = WordState();
  void start() {
    wordState.controller.animateTo(1);
  }

  void onComplete(Function onComplete) =>
      wordState.controller.addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          onComplete();
        }
      });

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return wordState;
  }
}

class WordState extends State<Word> with TickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    duration: Duration(milliseconds: (60 * widget.word.length)),
    vsync: this,
  );
  late final Animation<double> animation =
      Tween<double>(begin: 0.0, end: 1.0).animate(controller)
        ..addStatusListener((AnimationStatus status) {
          if (status == AnimationStatus.completed) {
            // controller.reset();
          }
        });

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(widget.word),
          LinePaint(animation: animation),
        ],
      ),
    );
  }
}

class LinePaint extends CustomPaint {
  const LinePaint({super.key, required this.animation});
  final Animation<double> animation;
  @override
  CustomPainter? get painter => Line(animation: animation);
}

class Line extends CustomPainter {
  Line({required this.animation}) : super(repaint: animation);
  final Animation<double> animation;
  double width = 0.0;
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & Size(size.width * animation.value, 2);
    const RadialGradient gradient = RadialGradient(
      center: Alignment(0.7, -0.6),
      radius: 0.2,
      colors: <Color>[Color(0xFFFFFF00), Color(0xFF0099FF)],
      stops: <double>[0.4, 1.0],
    );
    canvas.drawRect(rect, Paint()..shader = gradient.createShader(rect));
  }

  @override
  bool shouldRepaint(Line oldDelegate) => false;
}
