import 'package:flutter/material.dart';
import 'package:tplayer/home/home_buttons.dart';
import 'package:tplayer/home/home_slider.dart';
import 'package:tplayer/logo/logo_holder.dart';

class OneLinePage extends StatefulWidget {
  const OneLinePage({super.key});

  final String title = 'Text Player';

  @override
  State<OneLinePage> createState() => _OneLinePageState();
}

class _OneLinePageState extends State<OneLinePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [SizedBox(height: 400), PlayerControls()]),
      ),
      floatingActionButton: Text('$screenHeight'),
    );
  }
}

class PlayerControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [PlayPause()],
          ),
        ),
      ],
    );
  }
}

class PlayPause extends StatelessWidget {
  @override
  Widget build(Object context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, 0),
            radius: 0.15,
            colors: <Color>[
              Color(0xFFEEEEEE),
              Color.fromARGB(255, 163, 163, 207),
            ],
            stops: <double>[0.0, 1.0],
          ),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: Icon(Icons.play_arrow, size: 22),
      ),
    );
  }
}
