import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tplayer/data/domain_models/text_line.dart';
import 'package:tplayer/data/repositories/content_repository.dart';
import 'package:tplayer/page_text/text_line/text_line.dart';
import 'package:tplayer/utils/result.dart';
import 'package:provider/provider.dart';

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
                  TextBlockLines(context.read<PageTextViewModel>()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageTextViewModel {
  PageTextViewModel({required ContentRepository contentRepository})
    : _contentRepository = contentRepository;

  final ContentRepository _contentRepository;

  Future<Result<List<TextLineDataModel>>> getListTextLines() =>
      _contentRepository.getListTextLines();
}

class TextBlockLines extends StatefulWidget {
  TextBlockLines(this._pageTextViewModel);
  PageTextViewModel _pageTextViewModel;
  @override
  State<TextBlockLines> createState() => _TextBlockLinesState();
}

typedef ListTextLineData = Result<List<TextLineDataModel>>;

class _TextBlockLinesState extends State<TextBlockLines> {
  late final Future<ListTextLineData> _dataFuture;

  @override
  void initState() {
    super.initState();
    _dataFuture = widget._pageTextViewModel.getListTextLines();
  }

  @override
  build(BuildContext context) {
    return FutureBuilder<ListTextLineData>(
      future: _dataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        final data = snapshot.data!;
        switch (data) {
          case Ok():
            return Column(
              children: [
                (data as Ok).value.map(
                  (TextLineDataModel e) => TextLine(line: e.text),
                ),
              ],
            );
          case Error():
            return Column(children: [Text((data as Error).toString())]);
        }
      },
    );
  }
}
