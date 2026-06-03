import 'package:flutter/material.dart';
import 'package:tplayer/one_line/one_line.dart';
import 'package:tplayer/ui/play_pause.dart';
import 'package:tplayer/ui/test_button.dart';

class PlayerControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ChildWidth,

      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: Color.fromARGB(255, 224, 225, 245),
          // backgroundBlendMode: BlendMode.hue,
          image: DecorationImage(
            image: AssetImage('img/pattern3.webp'),
            repeat: ImageRepeat.repeat,
            fit: BoxFit.none,
            opacity: 0.05,
            scale: 0.75,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Align(alignment: Alignment.bottomLeft, child: ShowDetails()),
                  Backward(),
                  PlayPauseButton(),
                  Forward(),
                  PlaybackSpeed(),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class PlayPauseLocal extends StatelessWidget {
  @override
  Widget build(Object context) {
    return SizedBox(
      width: 80,
      height: 80,
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
          borderRadius: BorderRadius.all(Radius.circular(40)),
          border: BoxBorder.all(color: Color(0xFF8B8DBD), width: 1),
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
          border: BoxBorder.all(color: Color(0xFF8B8DBD), width: 1),
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
          border: BoxBorder.all(color: Color(0xFF8B8DBD), width: 1),
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

class PlaybackSpeed extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsetsGeometry.directional(start: 0),
        child: SizedBox(
          width: 58,
          height: 30,
          child: DecoratedBox(
            decoration: BoxDecoration(
              // gradient: RadialGradient(
              //   center: Alignment(0, 0),
              //   radius: 0.15,
              //   colors: <Color>[
              //     Color.fromARGB(255, 191, 196, 213),
              //     Color.fromARGB(255, 185, 185, 217),
              //   ],
              //   stops: <double>[0.0, 1.0],
              // ),
              // borderRadius: BorderRadius.all(Radius.circular(40)),
              // border: BoxBorder.all(
              //   color: Color(0xFF8B8DBD),
              //   width: 1,
              // ),
            ),
            child: TestButton.outline2(
              child: Text(
                '0.85x',
                textHeightBehavior: const TextHeightBehavior(
                  applyHeightToFirstAscent: false,
                  applyHeightToLastDescent: true,
                ),
                strutStyle: StrutStyle(height: 1),
                style: TextStyle(
                  color: Color.fromARGB(255, 76, 80, 107),
                  fontSize: 18,
                  height: 1,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ShowDetails_1 extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsetsGeometry.only(left: 8),
        child: SizedBox(
          width: 50,
          height: 30,
          child: DecoratedBox(
            decoration: BoxDecoration(
              // gradient: RadialGradient(
              //   center: Alignment(0, 0),
              //   radius: 0.15,
              //   colors: <Color>[
              //     Color.fromARGB(255, 213, 226, 227),
              //     Color.fromARGB(255, 181, 199, 196),
              //   ],
              //   stops: <double>[0.0, 1.0],
              // ),
              borderRadius: BorderRadius.all(Radius.circular(40)),
              // border: BoxBorder.all(
              //   color: const Color.fromARGB(255, 234, 244, 247),
              //   width: 1,
              // ),
            ),
            child: Icon(
              Icons.pending_rounded,
              size: 30,
              color: const Color.fromARGB(255, 145, 151, 165),
            ),
          ),
        ),
      ),
    );
  }
}

class ShowDetails extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsetsGeometry.zero,
        child: SizedBox(
          width: 50,
          height: 30,
          child: TestButton.outline(label: '', icon: Icons.pending_rounded),
        ),
      ),
    );
  }
}
