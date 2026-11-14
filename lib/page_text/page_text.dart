import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tplayer/data/domain_models/text_line.dart';
import 'package:tplayer/page_text/text_line/text_line.dart';
import 'package:tplayer/state/page_text_list_textlines.dart';

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
    return Center(child: SizedBox(width: 400, child: ColumnTextLines()));
  }
}

class ColumnTextLines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<TextPageLinesViewModel>().add(GetTextPageLines());
    return BlocBuilder<TextPageLinesViewModel, List<TextLineDataModel>>(
      builder: (context, listTextLines) {
        return Column(
          children: [...listTextLines.map((e) => TextLine(line: e.text))],
        );
      },
    );
  }
}
