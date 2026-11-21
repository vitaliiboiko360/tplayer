import 'dart:math';

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
                      return null;
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
                  .where((e) => e != null)
                  .cast<Widget>()
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final topBotoms = List<(int, int, int)>.empty(growable: true);
      for (int i = 0; i < widget.itemsKeys.length; i++) {
        final context = widget.itemsKeys[i].currentContext;
        if (context == null) continue;

        final box = context.findRenderObject() as RenderBox;

        // totalLen +=
        //     (box.localToGlobal(.zero).dy -
        //             box.localToGlobal(box.size.bottomRight(.zero)).dy)
        //         .abs();

        topBotoms.add((
          box.localToGlobal(.zero).dy.toInt(),
          box.localToGlobal(box.size.bottomRight(.zero)).dy.toInt(),
          i + 1,
        ));
      }
      print(
        '\***\n ${topBotoms.map((e) => '${e.$3} = ${e.$1} ${e.$2}').join(' | ')} \n***\n',
      );
    });
    super.initState();
  }

  int _onScrollCallCounter = 1;
  double _prevPixels = 0;
  int _prevIndex = 0;
  int _separatorHeight = 11;
  final _toolbarHeight = 60;
  final int _scrollStep = 3;

  double _to2(double inputDouble) => (inputDouble * 100).truncate() / 100;
  void p(dynamic s) => print(s);

  void _onScroll() {
    var byDevPixRatio = (double input) =>
        input * MediaQuery.devicePixelRatioOf(context);

    double totalLen = 0;
    double pixels = _controller.position.pixels;
    double requestedDistance = (_prevPixels - pixels).abs();

    bool isDown = (_prevPixels - pixels) > 0 ? true : false;
    final topBotoms = List<(int, int, int)>.empty(growable: true);

    for (int i = 0; i < widget.itemsKeys.length; i++) {
      final context = widget.itemsKeys[i].currentContext;
      if (context == null) continue;

      final box = context.findRenderObject() as RenderBox;

      totalLen +=
          (box.localToGlobal(.zero).dy -
                  box.localToGlobal(box.size.bottomRight(.zero)).dy)
              .abs();

      topBotoms.add((
        box.localToGlobal(.zero).dy.toInt(),
        box.localToGlobal(box.size.bottomRight(.zero)).dy.toInt(),
        i + 1,
      ));
    }

    var nextIndex = 0;
    if (isDown) {
      nextIndex = max(0, _prevIndex - _scrollStep);
    } else {
      nextIndex = min(_prevIndex + _scrollStep, widget.items.length - 1);
    }
    p('isDown is = ${isDown}');
    double offsetTo = topBotoms[nextIndex].$1.toDouble();
    // +
    // byDevPixRatio(_toolbarHeight.toDouble());

    _controller.animateTo(
      offsetTo,
      duration: Duration(microseconds: 100),
      curve: Curves.easeOut,
    );

    print(
      '\n---\n ${topBotoms.map((e) => '${e.$3} = ${e.$1} ${e.$2}').join(' | ')}',
    );
    p('_prevIndex was ${_prevIndex}');
    setState(() {
      _prevIndex = nextIndex;
      _prevPixels = pixels;
      p('setting prevIndex to');
    });
    p('nextIndex is ${nextIndex}');

    p('offsetTo ${offsetTo}');
    // print('*totalLen * ${totalLen}*\n');
    // print(' = atEdge = ${_controller.position.atEdge}');
    // print(' = viewportDimension =  ${_controller.position.viewportDimension}');
    // print(' = pixels = ${_controller.position.pixels}');
    // print(' = minScrollExtent = ${_controller.position.minScrollExtent}');
    // print(' = maxScrollExtent = ${_controller.position.maxScrollExtent}');
    // p('');
  }

  bool _onScrollNotify(ScrollNotification notify) {
    return false;
    p('-----------------------------------------------');
    print('notifier');
    p('atEdge ${notify.metrics.atEdge}');
    p('viewportDimension ${notify.metrics.viewportDimension}');
    p('pixels ${notify.metrics.pixels}');
    p('minScrollExtent ${notify.metrics.minScrollExtent}');
    p('maxScrollExtent ${notify.metrics.maxScrollExtent}');
    p('-----------------------------------------------');
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
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        child: Column(
          crossAxisAlignment: .start,
          children: [
            ...List.generate(
              widget.items.length,
              (index) => Column(
                crossAxisAlignment: .start,
                children: [
                  widget.items[index],
                  if (index < widget.items.length - 1) DashedDivider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build2(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _onScrollNotify,
      child: ListView.separated(
        itemCount: widget.items.length,
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
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
          padding: .directional(start: 15, end: 15, top: 5, bottom: 5),
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
