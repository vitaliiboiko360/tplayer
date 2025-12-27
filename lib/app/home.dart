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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('You have pushed the button this many times:'),
          SelectionArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Selectable text'),
                SelectionContainer.disabled(child: Text('Non-selectable text')),
                Text('Selectable text'),
                ...(lines
                    .map((line) => (line.split(' ')).map((w) => Word(word: w)))
                    .expand((e) => e)
                    .toList()),
              ],
            ),
          ),
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

class Word extends StatelessWidget {
  const Word({super.key, required this.word});
  final String word;
  @override
  Widget build(BuildContext context) {
    return Column(children: [Text(word), Underline()]);
  }
}

class Underline extends CustomPaint {
  const Underline({super.key});
  @override
  CustomPainter? get painter => Line();
}

class Line extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
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
