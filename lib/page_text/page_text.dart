import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tplayer/page_text/text_line/text_line.dart';

class PageText extends StatefulWidget {
  const PageText({super.key});

  final String title = 'Text Player';

  @override
  State<PageText> createState() => _PageTextState();
}

class _PageTextState extends State<PageText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: .center,
          spacing: 10,
          children: [
            Text('Name of the story'),
            Padding(
              padding: .directional(start: 50),
              child: Align(
                alignment: .centerEnd,
                child: IconButton(
                  onPressed: () => context.go('/story'),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.fromMap({
                      WidgetState.any: Theme.of(context).colorScheme.primary
                          .withValues(alpha: .08),
                    }),
                  ),
                  icon: Icon(Icons.settings),
                  // child: Text('Text Button'),
                ),
              ),
            ),
          ],
        ),
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

const lines = [
  "Deja que te cuente una historia sobre un pollito.",
  "Su nombre es Pollito Tito.",
  "Él vive en un gallinero pequeño y normal en un barrio pequeño y normal.",
];
