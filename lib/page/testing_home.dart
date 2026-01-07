import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/rendering.dart';

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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(widget.title),
        actions: [
          ElevatedButton(
            onPressed: () => context.go('/details'),
            child: const Text('Go to the Details screen'),
          ),
        ],
      ),
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
    double remainedHeight = MediaQuery.sizeOf(context).height - 56;
    return Center(
      child: Container(
        margin: EdgeInsets.all(0.0), // Space outside the container
        width: 500,
        // height: remainedHeight,
        padding: EdgeInsets.all(15.0), // Space inside the container
        decoration: BoxDecoration(color: Colors.lightBlue[100]),
        child: InnerCatalog4(),
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
      itemCount: itemCount,
      controller: ScrollController(),
      itemBuilder: (BuildContext context, int index) {
        if (index >= entries.length) return const SizedBox.shrink();
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

class InnerCataloConstrained extends StatelessWidget {
  const InnerCataloConstrained({super.key});
  final double appBarHeight = kToolbarHeight;

  @override
  Widget build(BuildContext context) {
    // double containerHeight =
    //     MediaQuery.sizeOf(context).height - appBarHeight - 100;
    // int itemCount = (containerHeight / 116).truncate();

    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyMedium!,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: SizedBox(width: 400, height: 400),
              // SizedBox.shrink(),

              //  IntrinsicHeight(
              //   child: ListView.builder(
              //     shrinkWrap: false,
              //     padding: const EdgeInsets.all(8),
              //     itemCount: 10,
              //     controller: ScrollController(),
              //     itemBuilder: (BuildContext context, int index) {
              //       if (index >= entries.length) return const SizedBox.shrink();
              //       return Padding(
              //         padding: EdgeInsetsGeometry.directional(
              //           start: 0,
              //           top: 10,
              //           bottom: 10,
              //           end: 0,
              //         ),
              //         child: Container(
              //           height: 100,
              //           color: Colors.amber[colorCodes[index]],
              //           child: Center(child: Text('Entry ${entries[index]}')),
              //         ),
              //       );
              //     },
              //   ),
              // ),
            ),
          );
        },
      ),
    );
  }
}

class InnerCatalog2 extends StatefulWidget {
  const InnerCatalog2({super.key});

  @override
  State<InnerCatalog2> createState() => InnerCatalogState2();
}

class InnerCatalogState2 extends State<InnerCatalog2> {
  late final ScrollController _controller;
  late final ScrollPhysics _physics;

  @override
  void initState() {
    _controller = ScrollController();
    _physics = ScrollPhysics();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // double containerHeight = MediaQuery.sizeOf(context).height - 56;
    // int itemCount = (containerHeight / 116).toInt();
    return Scrollable(
      viewportBuilder: viewportBuilder,
      controller: _controller,
      physics: _physics,
      scrollBehavior: ScrollBehavior(),
    );
  }
}

Widget element(index) => Padding(
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

Widget viewportBuilder(BuildContext context, ViewportOffset position) =>
    SizedBox(
      height: 1000,
      child: Column(children: [Text('${position.hasPixels}')]),
    );

class InnerCatalog4 extends StatelessWidget {
  InnerCatalog4({super.key});

  void _handlePageViewChanged(int currentPageIndex) {
    print('$_currentPageIndex');
  }

  late PageController _pageViewController = PageController();
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PageView(
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      controller: _pageViewController,
      onPageChanged: _handlePageViewChanged,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Column(children: [Text('First Page', style: TextStyle(fontSize: 25))]),
        Column(children: [Text('Second Page', style: TextStyle(fontSize: 25))]),
        Column(children: [Text('Third Page', style: TextStyle(fontSize: 25))]),
      ],
    );
  }
}

class InnerCatalog5 extends StatelessWidget {
  InnerCatalog5({super.key});

  void _handlePageViewChanged(int currentPageIndex) {
    print('$_currentPageIndex');
  }

  late PageController _pageViewController = PageController();
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyMedium!,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    Container(
                      // A fixed-height child.
                      color: const Color(0xffeeee00), // Yellow
                      height: 120.0,
                      alignment: Alignment.center,
                      child: const Text('Fixed Height Content'),
                    ),
                    Expanded(
                      // A flexible child that will grow to fit the viewport but
                      // still be at least as big as necessary to fit its contents.
                      child: Container(
                        color: const Color(0xffee0000), // Red
                        height: 120.0,
                        alignment: Alignment.center,
                        child: const Text('Flexible Content'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class InnerCatalog6 extends StatelessWidget {
  const InnerCatalog6({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyMedium!,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    // A fixed-height child.
                    color: const Color(0xffeeee00), // Yellow
                    height: 120.0,
                    alignment: Alignment.center,
                    child: const Text('Fixed Height Content'),
                  ),
                  Container(
                    // Another fixed-height child.
                    color: const Color(0xff008000), // Green
                    height: 120.0,
                    alignment: Alignment.center,
                    child: const Text('Fixed Height Content'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
