import 'dart:math';

import 'package:flutter/material.dart';

import 'package:collection/collection.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tplayer/audio/audio.dart';
import 'package:tplayer/data/domain_models/text_line.dart';
import 'package:tplayer/page_text/text_line/text_line.dart';
import 'package:tplayer/state_bloc/page_text_list_textlines.dart';

class TextBlock extends StatelessWidget {
  const TextBlock({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(child: SizedBox(width: 400, child: ColumnTextLines()));
  }
}

class TextBlockWithAudio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AudioCubit(),
      child: Stack(
        children: [
          Audio('http://192.168.0.23:8081/public/mp3/threepigs.mp3'),
          TextBlock(),
        ],
      ),
    );
  }
}

class ColumnTextLines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<TextPageLinesViewModel>().add(GetTextPageLines());
    return BlocBuilder<TextPageLinesViewModel, List<TextLineDataModel>>(
      builder: (context, listTextLines) {
        List<GlobalKey> itemsKeys = List<GlobalKey>.empty(growable: true);
        int scrollIndex = 0;
        List<Widget> items = listTextLines
            .mapIndexed((index, element) {
              scrollIndex++;
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
                          '${scrollIndex}: ' +
                          elementInner +
                          ((indexInner + 1 < numberOfSentences) ? '.' : ''),
                      onClickAudioTime: () {
                        AudioCubit audioCubit = BlocProvider.of<AudioCubit>(
                          context,
                        );
                        audioCubit.setTime(
                          element.audioStart,
                          element.audioEnd,
                        );
                        audioCubit.play();
                      },
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
        topBotoms.add((
          box.localToGlobal(.zero).dy.toInt(),
          box.localToGlobal(box.size.bottomRight(.zero)).dy.toInt(),
          i + 1,
        ));
      }
    });
    super.initState();
  }

  double _prevPixels = 0;
  int _prevIndex = 0;
  final _toolbarHeight = 60;
  final int _scrollStep = 3;

  void p(dynamic s) => print(s);

  void _onScroll() {
    double pixels = _controller.position.pixels;
    bool isUp = (_prevPixels - pixels) > 0 ? true : false;
    final topBotoms = List<(int, int, int)>.empty(growable: true);

    _controller.position.correctPixels(0);

    for (int i = 0; i < widget.itemsKeys.length; i++) {
      final context = widget.itemsKeys[i].currentContext;
      if (context == null) continue;

      final box = context.findRenderObject() as RenderBox;
      topBotoms.add((
        box.localToGlobal(.zero).dy.toInt(),
        box.localToGlobal(box.size.bottomRight(.zero)).dy.toInt(),
        i + 1,
      ));
    }

    var nextIndex = 0;
    if (isUp) {
      nextIndex = max(0, _prevIndex - _scrollStep);
    } else {
      nextIndex = min(_prevIndex + _scrollStep, widget.items.length - 1);
    }

    double offsetTo =
        topBotoms[nextIndex].$1.toDouble() - _toolbarHeight.toDouble();

    _controller.position.correctPixels(offsetTo);

    setState(() {
      _prevIndex = nextIndex;
      _prevPixels = offsetTo;
    });
  }

  bool _onScrollNotify(ScrollNotification notify) {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _onScrollNotify,
      child: SingleChildScrollView(
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
            )..add(
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 0,
                  maxHeight: MediaQuery.sizeOf(context).height * 0.5,
                ),
                child: Container(
                  color: const Color.fromARGB(255, 230, 235, 240),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    super.dispose();
  }
}

class ReciveButIgnoreUsersScrolling extends ScrollPhysics {
  @override
  ScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return this;
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
