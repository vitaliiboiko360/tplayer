import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tplayer/home/home_slider.dart';
import 'package:tplayer/logo/logo_holder.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            LogoHolder(),
            SizedBox(height: 10),
            HomeSlider(),
            HomeButtons(),
          ],
        ),
      ),
      floatingActionButton: Text('$screenHeight'),
    );
  }
}

class HomeButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [SizedBox(height: 10), OneLineButton()]);
  }
}

class OneLineButton extends StatelessWidget {
  @override
  Widget build(Object context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: RadialGradient(
          center: Alignment(-0.5, -0.6),
          radius: 0.15,
          colors: <Color>[Color(0xFFEEEEEE), Color(0xFF111133)],
          stops: <double>[0.9, 1.0],
        ),
      ),
      child: SizedBox(width: 260, height: 200),
    );
  }
}
