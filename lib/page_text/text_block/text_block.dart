import 'package:flutter/material.dart';

import 'package:collection/collection.dart';

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
        List<Widget> items = listTextLines
            .mapIndexed((index, element) {
              final numberOfSentences = element.text
                  .split(RegExp(r'(?<!\.)\.(?!\.)'))
                  .length;
              final sentences = element.text
                  .split(RegExp(r'(?<!\.)\.(?!\.)'))
                  .mapIndexed((indexInner, elementInner) {
                    if (elementInner.isEmpty) {
                      return SizedBox.shrink();
                    }
                    return TextLine(
                      line:
                          elementInner +
                          ((indexInner + 1 < numberOfSentences) ? '.' : ''),
                    );
                  })
                  .toList();
              return sentences;
            })
            .flattened
            .toList();

        return ScrollLines(items: items);

        // return Column(
        //   crossAxisAlignment: .start,
        //   children: listTextLines
        //       .mapIndexed((index, element) {
        //         final numberOfSentences = element.text
        //             .split(RegExp(r'(?<!\.)\.(?!\.)'))
        //             .length;
        //         final sentences = element.text
        //             .split(RegExp(r'(?<!\.)\.(?!\.)'))
        //             .mapIndexed((indexInner, elementInner) {
        //               if (elementInner.isEmpty) {
        //                 return SizedBox.shrink();
        //               }
        //               return Column(
        //                 crossAxisAlignment: .start,
        //                 children: [
        //                   TextLine(
        //                     line:
        //                         elementInner +
        //                         ((indexInner + 1 < numberOfSentences)
        //                             ? '.'
        //                             : ''),
        //                   ),
        //                   if (index + 1 < listTextLines.length &&
        //                       indexInner + 1 < numberOfSentences)
        //                     DashedDivider(
        //                       color: Colors.grey.shade400,

        //                       // thickness: 1.0, // Actual height of the visible line
        //                       height: 1.0, // Total vertical space (includes top/bottom padding)
        //                       // indent: 16.0, // Left spacing
        //                       // endIndent: 16.0, // Right spacing
        //                       // radius: BorderRadius.circular(4.0), // Rounded line caps
        //                     ),
        //                 ],
        //               );
        //             })
        //             .toList();
        //         return sentences;
        //       })
        //       .flattened
        //       .toList(),
        // );
      },
    );
  }
}

class ScrollLines extends StatefulWidget {
  ScrollLines({super.key, required this.items});

  List<Widget> items;

  @override
  State<ScrollLines> createState() => _ScrollLinesState();
}

class _ScrollLinesState extends State<ScrollLines> {
  late final ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _controller,
      slivers: [
        SliverList.separated(
          itemBuilder: (BuildContext context, int index) {
            if (index >= widget.items.length) {
              return null;
            }
            return widget.items[index];
          },
          separatorBuilder: (BuildContext context, int index) {
            return DashedDivider();
          },
        ),
      ],
    );
  }
}

class DashedDivider extends StatelessWidget {
  final double height;
  final double dashWidth;
  final double dashGap;
  final Color color;

  const DashedDivider({
    super.key,
    this.height = 1,
    this.dashWidth = 4,
    this.dashGap = 3,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashCount = (boxWidth / (dashWidth + dashGap)).floor();

        return Padding(
          padding: .directional(start: 10, end: 10),
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: List.generate(dashCount, (_) {
              return ClipRRect(
                borderRadius: .all(.circular(height / 2)),
                child: SizedBox(
                  width: dashWidth,
                  height: height,
                  child: DecoratedBox(decoration: BoxDecoration(color: color)),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
