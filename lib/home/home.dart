import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  final String title = 'Text Player';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Catalog(),
      floatingActionButton: Text('$screenHeight'),
    );
  }
}

class Catalog extends StatelessWidget {
  const Catalog({super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerCatalog();
  }
}

class ContainerCatalog extends StatelessWidget {
  const ContainerCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    // double remainedHeight = MediaQuery.sizeOf(context).height - 56;
    return Center(
      child: Container(
        margin: EdgeInsets.all(0.0), // Space outside the container
        width: 500,
        // height: remainedHeight,
        padding: EdgeInsets.all(15.0), // Space inside the container
        decoration: BoxDecoration(color: Colors.lightBlue[100]),
        child: InnerCatalog(),
      ),
    );
  }
}

final List<String> entries = List<String>.generate(
  20,
  (int index) => ['A', 'B', 'C'][index % 3],
  growable: true,
);
final List<int> colorCodes = List<int>.generate(
  20,
  (int index) => 100 * ((index % 9) + 1),
  growable: true,
);

class InnerCatalog extends StatelessWidget {
  const InnerCatalog({super.key});
  final double appBarHeight = kToolbarHeight;

  @override
  Widget build(BuildContext context) {
    double containerHeight =
        MediaQuery.sizeOf(context).height - appBarHeight - 100;
    int itemCount = (containerHeight / 116).truncate();
    return ListView.builder(
      shrinkWrap: false,
      padding: const EdgeInsets.all(8),
      // itemCount: itemCount,
      controller: ScrollController(),
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        if (index >= entries.length) return null;
        return Padding(
          padding: EdgeInsetsGeometry.directional(
            start: 0,
            top: 10,
            bottom: 10,
            end: 0,
          ),
          child: Container(
            height: 100,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text('Entry ${entries[index]}')),
          ),
        );
      },
    );
  }
}

class Slider extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: IndexedStack(index: _index, children: slides),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    _index = (_index - 1) % slides.length;
                  });
                },
                child: const Icon(Icons.chevron_left, key: Key('gesture1')),
              ),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _index = (_index + 1) % slides.length;
                  });
                },
                child: const Icon(Icons.chevron_right, key: Key('gesture2')),
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
];

class Slide extends StatelessWidget {
  Slide(this.decorationColors);
  final DecorationColors decorationColors;
  @override
  Widget build(BuildContext context) {
    return Container(
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
