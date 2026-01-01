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
        height: remainedHeight,
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

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.sizeOf(context).height - 56;
    int itemCount = (containerHeight / 116).toInt();
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: itemCount,
      controller: ScrollController(),
      itemBuilder: (BuildContext context, int index) {
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
        Center(child: Text('First Page', style: TextStyle(fontSize: 25))),
        Center(child: Text('Second Page', style: TextStyle(fontSize: 25))),
        Center(child: Text('Third Page', style: TextStyle(fontSize: 25))),
      ],
    );
  }
}
