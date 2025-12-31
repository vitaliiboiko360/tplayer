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
    return Container(
      margin: EdgeInsets.all(0.0), // Space outside the container
      padding: EdgeInsets.all(15.0), // Space inside the container
      // Color must be inside decoration if decoration is used
      decoration: BoxDecoration(color: Colors.lightBlue[100]),
    );
  }
}
