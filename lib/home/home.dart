import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tplayer/home/home_slider.dart';

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
      appBar: AppBar(title: Text('Text Player Route /'), centerTitle: true),
      body: HomeSlider(),
      floatingActionButton: Text('$screenHeight'),
    );
  }
}
