import 'package:flutter/material.dart';
import 'package:tplayer/home/home.dart';

class HomeSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: SlideHolder());
  }
}

class SlideHolder extends StatefulWidget {
  const SlideHolder({super.key});

  @override
  State<SlideHolder> createState() => _SlideHolderState();
}

class _SlideHolderState extends State<SlideHolder> {
  int _index = 0;
  int _previousIndex = -1;

  void decrementIndex() {
    if (_index == 0) return;
    setState(() {
      _previousIndex = _index;
      _index = (_index - 1) % slides.length;
    });
  }

  void incrementIndex() {
    if (_index == slides.length - 1) return;
    setState(() {
      _previousIndex = _index;
      _index = (_index + 1) % slides.length;
    });
  }

  void setIndex(int i) => setState(() {
    _index = i;
  });

  bool isRightToLeft() => _previousIndex < _index;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 150),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position:
                      Tween<Offset>(
                        begin: Offset(isRightToLeft() ? 0.15 : -0.15, 0.0),
                        end: const Offset(0.0, 0.0),
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeIn,
                        ),
                      ),
                  child: child,
                ),
              );
            },
            child: IndexedStack(
              key: ValueKey<int>(_index),
              index: _index,
              children: slides,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: decrementIndex,
                child: Icon(
                  Icons.chevron_left,
                  key: Key('gesture1'),
                  color: _index == 0
                      ? const Color.fromARGB(150, 158, 158, 158)
                      : const Color.fromARGB(255, 83, 83, 83),
                ),
              ),
              const SizedBox(width: 5),
              Row(
                spacing: 0,
                children: List.generate(
                  slides.length,
                  (i) => GestureDetector(
                    onTap: () => setIndex(i),
                    behavior: HitTestBehavior.opaque,
                    child: Padding(
                      padding: EdgeInsetsGeometry.all(3),
                      child: Transform.scale(
                        scale: 0.4,
                        child: Icon(
                          Icons.fiber_manual_record,
                          key: Key('circle$i'),
                          color: _index == i
                              ? const Color.fromARGB(255, 83, 83, 83)
                              : const Color.fromARGB(150, 158, 158, 158),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: incrementIndex,
                child: Icon(
                  Icons.chevron_right,
                  key: Key('gesture2'),
                  color: _index == slides.length - 1
                      ? const Color.fromARGB(150, 158, 158, 158)
                      : Color.fromARGB(255, 83, 83, 83),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DecorationColors {
  final Color color;
  final Color border;

  DecorationColors(this.color, this.border);
}

List<DecorationColors> colors = [
  DecorationColors(
    Color.fromARGB(255, 239, 248, 255),
    Color.fromARGB(255, 54, 60, 244),
  ),
  DecorationColors(
    Color.fromARGB(255, 254, 239, 255),
    Color.fromARGB(255, 143, 54, 244),
  ),
  DecorationColors(
    Color.fromARGB(255, 240, 255, 239),
    Color.fromARGB(255, 54, 244, 155),
  ),
  DecorationColors(
    Color.fromARGB(255, 250, 239, 255),
    Color.fromARGB(255, 171, 54, 244),
  ),
  DecorationColors(
    Color.fromARGB(255, 255, 254, 239),
    Color.fromARGB(255, 244, 231, 54),
  ),
  DecorationColors(
    Color.fromARGB(255, 255, 243, 239),
    Color.fromARGB(255, 244, 146, 54),
  ),
];

class Slide extends StatelessWidget {
  Slide(this.decorationColors);
  final DecorationColors decorationColors;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        color: decorationColors.color,
        border: Border.all(color: decorationColors.border),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Text(''),
    );
  }
}

var slides = List.generate(colors.length, (index) => Slide(colors[index]));
