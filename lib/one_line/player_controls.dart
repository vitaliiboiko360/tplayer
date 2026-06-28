import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tplayer/one_line/one_line.dart';
import 'package:tplayer/state/playback_speed_slider.dart';
import 'package:tplayer/state/show_details_menu.dart';
import 'package:tplayer/ui/button_animated.dart';
import 'package:tplayer/ui/play_pause.dart';

const decoratedBoxOld = DecoratedBox(
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
  child: SizedBox.expand(),
);

const playerContolsHeight = TextBlockWidth;

class PlayerControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShowDetailsMenuCubit>(
            create: (BuildContext context) => ShowDetailsMenuCubit()),
        BlocProvider<PlaybackSpeedSliderCubit>(
          create: (BuildContext context) => PlaybackSpeedSliderCubit(),
        )
      ],
      child: SizedBox(
        width: TextBlockWidth,
        height: 110,
        child: Stack(clipBehavior: Clip.none, children: [
          Column(
            children: [
              SizedBox(height: 20),
              Container(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: ShowDetails(),
                    ),
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
          PlaybackSpeedSlider()
        ]),
      ),
    );
  }
}

class ShowDetailsMenu extends StatefulWidget {
  const ShowDetailsMenu({super.key});

  @override
  State<ShowDetailsMenu> createState() => _ShowDetailsMenuState();
}

class _ShowDetailsMenuState extends State<ShowDetailsMenu>
    with SingleTickerProviderStateMixin {
  late bool isOpened;
  AnimationController? _controller;
  Animation<Offset>? _offsetAnimation;

  @override
  void initState() {
    isOpened = false;

    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      reverseDuration: Duration(milliseconds: 100),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeInOut,
    ));
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose(); // Always dispose your controllers
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var showDetailsMenuState = BlocProvider.of<ShowDetailsMenuCubit>(
      context,
      listen: true,
    );

    if (showDetailsMenuState.state.isOpened) {
      setState(() {
        _controller?.forward();
      });
    } else {
      setState(() {
        _controller?.reverse();
      });
    }
    return
        // showDetailsMenuState.state.isOpened
        //     ?
        Positioned(
      top: -88,
      left: 0,
      width: 150,
      height: 100,
      child: Container(
          width: 150,
          height: 100,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(),
          child: SlideTransition(
            // offset: _offsetAnimation.value,
            // duration: Duration(microseconds: 300),
            // curve: Curves.easeInOut,
            position: _offsetAnimation!,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 204, 218, 253),
              ),
              child: SizedBox(width: 150, height: 100, child: Text('Menu')),
            ),
          )),
    );
    // : SizedBox.shrink();
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
  Widget build(BuildContext context) {
    VoidCallback onTap = () {
      print(
          'onTap isOpened= ${BlocProvider.of<PlaybackSpeedSliderCubit>(context).state.isOpened}');
      if (!BlocProvider.of<PlaybackSpeedSliderCubit>(context).state.isOpened) {
        BlocProvider.of<PlaybackSpeedSliderCubit>(context).setOpen();
      }
    };
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsetsGeometry.directional(start: 0),
        child: SizedBox(
          width: 58,
          height: 30,
          child: Container(
            child: ButtonAnimated(
              label: '',
              onTap: onTap,
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

class PlaybackSpeedSlider extends StatefulWidget {
  PlaybackSpeedSlider({super.key});

  @override
  State<PlaybackSpeedSlider> createState() => _PlaybackSpeedSliderState();
}

class _PlaybackSpeedSliderState extends State<PlaybackSpeedSlider>
    with SingleTickerProviderStateMixin {
  double _sliderValue = 0;
  AnimationController? _controller;
  Animation<Offset>? _offsetAnimation;

  final OverlayPortalController _overlayController = OverlayPortalController();

  void _sliderOnChanged(value) {
    setState(() {
      _sliderValue = value;
    });
  }

  @override
  void initState() {
    _sliderValue = 0.5;

    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      reverseDuration: Duration(milliseconds: 100),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeInOut,
    ));
    // _controller!.addStatusListener((AnimationStatus animationStatus) {
    //   if (animationStatus.isForwardOrCompleted) {
    //     _overlayController.show();
    //   }
    // });
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose(); // Always dispose your controllers
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var showDetailsMenuState = BlocProvider.of<PlaybackSpeedSliderCubit>(
      context,
      listen: true,
    );

    if (showDetailsMenuState.state.isOpened) {
      setState(() {
        _controller?.forward();
      });
    } else {
      setState(() {
        _controller?.reverse();
      });
    }
    return Positioned(
      top: -88,
      right: 0,
      width: 150,
      height: 100,
      child: Container(
          width: 150,
          height: 100,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(),
          child: SlideTransition(
            position: _offsetAnimation!,
            child: DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 204, 218, 253),
                ),
                child: TapRegion(
                  onTapOutside: (event) {
                    showDetailsMenuState.setClose();
                  },
                  child: SizedBox(
                    width: 150,
                    height: 100,
                    child: SizedBox.expand(),
                  ),
                  // OverlayPortal(
                  //     controller: _overlayController,
                  //     overlayChildBuilder: (context) => Slider(
                  //           value: _sliderValue,
                  //           onChanged: _sliderOnChanged,
                  //         ),
                  //     child: SizedBox.shrink()),
                )),
          )),
    );
  }
}

class PlaybackSpeedSliderInner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PlaybackSpeedSliderInnerState();
}

class PlaybackSpeedSliderInnerState extends State<PlaybackSpeedSliderInner> {
  late double sliderValue;

  void sliderOnChanged(double value) {
    setState(() {
      print('slider on change');
      sliderValue = value;
    });
  }

  @override
  void initState() {
    sliderValue = 0.5;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: sliderValue,
      onChanged: sliderOnChanged,
    );
  }
}

class ShowDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VoidCallback onTap = () {
      BlocProvider.of<ShowDetailsMenuCubit>(context).toggleOpen();
    };

    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsetsGeometry.zero,
        child: SizedBox(
          width: 50,
          height: 30,
          child: ButtonAnimated(
            label: '',
            icon: Icons.pending_rounded,
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
