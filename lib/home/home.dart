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
