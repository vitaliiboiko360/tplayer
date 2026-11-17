import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tplayer/data/domain_models/text_line.dart';
import 'package:tplayer/page_text/page_text.dart';
import 'package:tplayer/page_text/text_block/text_block.dart';
import 'package:tplayer/page_text/text_line/text_line.dart';
import 'package:tplayer/state/page_text_list_textlines.dart';

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
          crossAxisAlignment: .start,
          children: [...listTextLines.map((e) => TextLine(line: e.text))],
        );
      },
    );
  }
}
