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
      // appBar: AppBar(title: Image.asset('img/logo.png'), centerTitle: true),
      body: Column(
        children: [LogoHolder(), SizedBox(height: 10), HomeSlider()],
      ),
      floatingActionButton: Text('$screenHeight'),
    );
  }
}

class LogoHolder extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Image.asset('img/logo.png', width: 120, height: 120);
  }
}
