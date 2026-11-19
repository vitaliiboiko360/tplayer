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
        List<GlobalKey> itemsKeys = List<GlobalKey>.empty(growable: true);
        int scrollIndex = 1;
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
                    GlobalKey itemKey = GlobalKey();
                    itemsKeys.add(itemKey);
                    return TextLine(
                      key: itemKey,
                      line:
                          '${scrollIndex++}: ' +
                          elementInner +
                          ((indexInner + 1 < numberOfSentences) ? '.' : ''),
                    );
                  })
                  .toList();
              return sentences;
            })
            .flattened
            .toList();
        return ScrollLines(items: items, itemsKeys: itemsKeys);

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
  ScrollLines({super.key, required this.items, required this.itemsKeys});

  List<Widget> items;
  List<GlobalKey> itemsKeys;

  @override
  State<ScrollLines> createState() => _ScrollLinesState();
}

class _ScrollLinesState extends State<ScrollLines> {
  late final ScrollController _controller;
  ScrollNotification? _lastNotify;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_onScroll);
    super.initState();
  }

  int _onScrollCallCounter = 1;

  void _onScroll() {
    // print('${_controller.position.pixels}');
    //if (_controller.position.isScrollingNotifier.value) return;
    double screenY = 1;
    final toolbarHeight = 60;
    int count = 5;
    var flagFirst = false;
    var lastItemPixels = 0.0;
    var pixelvalues = (top: 0.0, bot: 0.0);
    double totalLen = 0;
    int topIndex = 0;
    int botIndex = 0;

    for (int i = 0; i < widget.itemsKeys.length; i++) {
      final context = widget.itemsKeys[i].currentContext;
      if (context == null) continue;

      final box = context.findRenderObject() as RenderBox;

      print(
        '\n---< ${i + 1} >---\ntop == ${box.localToGlobal(.zero).dy}\t bot == ${box.localToGlobal(box.size.bottomRight(.zero)).dy} \t l = ${(box.localToGlobal(.zero).dy - box.localToGlobal(box.size.bottomRight(.zero)).dy).abs()}\n',
      );

      totalLen +=
          (box.localToGlobal(.zero).dy -
                  box.localToGlobal(box.size.bottomRight(.zero)).dy)
              .abs();

      // if (!flagFirst) {
      //   pixelvalues = (top: box.localToGlobal(.zero).dy, bot: pixelvalues.bot);
      //   topIndex = i + 1;
      //   flagFirst = true;
      // } else {
      //   pixelvalues = (
      //     top: pixelvalues.top,
      //     bot: box.localToGlobal(box.size.bottomRight(.zero)).dy,
      //   );
      //   botIndex = i + 1;
      // }

      if (i + 1 == widget.itemsKeys.length) {}

      // screenY = box.localToGlobal(box.size.bottomRight(.zero)).dy;
      // if (screenY < toolbarHeight) continue;
      // print('offset: ${_controller.offset}');
      // print('first visible item at ${i}  :');
      // print('screenY = ${screenY}');
      // if (count-- < 0) break;
    }
    print('*************${totalLen}***************\n');
    print(
      'viewport dims = ${_controller.position.viewportDimension}\npixels = ${_controller.position.pixels}\n\n',
    );
    // print('\n---< ${_onScrollCallCounter++} >---\ntop == ${pixelvalues.top}');
    // print('top index = $topIndex');
    // print('bot == ${pixelvalues.bot}');
    // print('bot index = $botIndex\n');
    // print(screenY);
    // print('_controller.position.pixels ${_controller.position.pixels}');
    // print('new offset = ${_controller.offset + (toolbarHeight - screenY)}');
    // _controller.position.animateTo(
    //   _controller.offset + (toolbarHeight - screenY),
    //   duration: Duration(microseconds: 100),
    //   curve: Curves.easeOut,
    // );
    _controller.animateTo(
      _controller.offset + (toolbarHeight - screenY) - 250,
      duration: Duration(microseconds: 100),
      curve: Curves.easeOut,
    );
  }

  bool _onScrollNotify(ScrollNotification notify) {
    return false;
    if (_lastNotify.runtimeType != notify.runtimeType) {
      if (_lastNotify?.metrics.pixels == notify.metrics.pixels) {
        print('last equal new');
        return false;
      }
      setState(() {
        _lastNotify = notify;
        print('===notify pixels ${notify.metrics.pixels}');
      });
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _onScrollNotify,
      child: CustomScrollView(
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
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    super.dispose();
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
