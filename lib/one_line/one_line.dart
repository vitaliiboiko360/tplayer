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
        // SizedBox(height: 400)
        child: Column(children: [TextBlock(), PlayerControls()]),
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
            spacing: 10,
            children: [Backward(), PlayPause(), Forward()],
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
              Color.fromARGB(255, 191, 196, 213),
              Color.fromARGB(255, 185, 185, 217),
            ],
            stops: <double>[0.0, 1.0],
          ),
          borderRadius: BorderRadius.all(Radius.circular(50)),
          border: BoxBorder.all(
            color: const Color.fromARGB(255, 91, 93, 109),
            width: 1,
          ),
        ),
        child: Icon(
          Icons.play_arrow_rounded,
          size: 50,
          color: Color.fromARGB(255, 76, 80, 107),
        ),
      ),
    );
  }
}

class TextBlock extends StatelessWidget {
  BorderSide borderSide = BorderSide(
    color: Colors.blue, // Specify your desired color
    width: 1.0, // Specify your desired width
  );

  @override
  Widget build(Object context) {
    return Stack(
      children: [
        SizedBox(
          width: 350,
          height: 400,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border(left: borderSide, right: borderSide),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.directional(start: 15, end: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          '\t\t\tDeja que te cuente una historia sobre un pollito. Su nombre es Pollito Tito. Él vive en un gallinero pequeño y normal en un barrio pequeño y normal.',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Forward extends StatelessWidget {
  @override
  Widget build(Object context) {
    return SizedBox(
      width: 50,
      height: 40,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, 0),
            radius: 0.15,
            colors: <Color>[
              Color.fromARGB(255, 191, 196, 213),
              Color.fromARGB(255, 185, 185, 217),
            ],
            stops: <double>[0.0, 1.0],
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: BoxBorder.all(
            color: const Color.fromARGB(255, 91, 93, 109),
            width: 1,
          ),
        ),
        child: Icon(
          Icons.fast_forward_rounded,
          size: 20,
          color: Color.fromARGB(255, 76, 80, 107),
        ),
      ),
    );
  }
}

class Backward extends StatelessWidget {
  @override
  Widget build(Object context) {
    return SizedBox(
      width: 50,
      height: 40,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, 0),
            radius: 0.15,
            colors: <Color>[
              Color.fromARGB(255, 191, 196, 213),
              Color.fromARGB(255, 185, 185, 217),
            ],
            stops: <double>[0.0, 1.0],
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: BoxBorder.all(
            color: const Color.fromARGB(255, 91, 93, 109),
            width: 1,
          ),
        ),
        child: Icon(
          Icons.fast_rewind_rounded,
          size: 20,
          color: Color.fromARGB(255, 76, 80, 107),
        ),
      ),
    );
  }
}
