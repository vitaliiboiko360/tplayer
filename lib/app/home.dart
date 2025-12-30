import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  final String title = 'Text Player';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: TextBlock(),
    );
  }
}

class TextBlock extends StatelessWidget {
  const TextBlock({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            SelectionArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 3,
                children: <Widget>[
                  Text('Selectable text'),
                  SelectionContainer.disabled(
                    child: Text('Non-selectable text'),
                  ),
                  Text('Selectable text'),
                  ...lines.map((line) => TextLine(line: line)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextLine extends StatelessWidget {
  TextLine({super.key, required this.line});
  final String line;
  List<Word> word = [];

  onClick() {
    for (var i = 0; i < word.length; i++) {
      word[i].start();
    }
  }

  @override
  Widget build(Object context) {
    word = [];
    return GestureDetector(
      onTap: onClick,
      child: Wrap(
        spacing: 0,
        runSpacing: 0,
        children: [
          ...line.split(' ').map((w) {
            var widget = Word(word: '$w ');
            // var controller = AnimationController(
            //   duration: Duration(seconds: 3),
            //   vsync: widget.wordState,
            // );
            word.add(widget);
            return widget;
          }),
        ],
      ),
    );
  }
}

const lines = [
  "Deja que te cuente una historia sobre un pollito.",
  "Su nombre es Pollito Tito.",
  "Él vive en un gallinero pequeño y normal en un barrio pequeño y normal.",
];

// ignore: must_be_immutable
class Word extends StatefulWidget {
  Word({super.key, required this.word});
  final String word;
  WordState wordState = WordState();
  void start() {
    wordState.controller.animateTo(3);
    wordState.controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        wordState.controller.reset();
      }
    });
  }

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return wordState;
  }
}

class WordState extends State<Word> with TickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  );

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
          Underline(listenable: controller),
        ],
      ),
    );
  }
}

class Underline extends AnimatedWidget {
  Underline({required super.listenable});

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return LinePaint(width: _progress.value);
  }
}

// ignore: must_be_immutable
class LinePaint extends CustomPaint {
  LinePaint({super.key, required this.width});
  double width = 0.0;
  @override
  CustomPainter? get painter => Line(width);
}

class Line extends CustomPainter {
  Line(this.width);
  double width = 0.0;
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & Size(size.width * width, 2);
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
