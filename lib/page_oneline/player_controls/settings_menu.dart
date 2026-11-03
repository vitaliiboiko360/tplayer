import 'package:defer_pointer/defer_pointer.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tplayer/page_oneline/page_oneline.dart';
import 'package:tplayer/page_oneline/player_controls/player_controls.dart';
import 'package:tplayer/page_oneline/player_controls/settings_menu.dart';
import 'package:tplayer/page_oneline/round_background/round_background.dart';
import 'package:tplayer/page_oneline/text_block/text_block.dart';
import 'package:tplayer/state/settings_menu.dart';

const boxShadowRadius = 5;

class SettingsMenu extends StatefulWidget {
  SettingsMenu(DeferredPointerHandlerLink this.link, {super.key});

  DeferredPointerHandlerLink link;
  @override
  State<SettingsMenu> createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<SettingsMenu>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<Offset>? _offsetAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      reverseDuration: Duration(milliseconds: 100),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0, 1.01),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller!, curve: Curves.easeOut));
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose(); // Always dispose your controllers
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var showDetailsMenuState = BlocProvider.of<SettingsMenuCubit>(
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
    const widthOfMenu = TextBlockWidth - 20;
    return Positioned(
      top: -225,
      left: 0,
      width: TextBlockWidth,
      height: 220,
      child: DeferPointer(
        link: widget.link,
        child: Container(
          width: TextBlockWidth,
          height: 220,
          clipBehavior: .antiAlias,
          decoration: BoxDecoration(),
          child: SlideTransition(
            position: _offsetAnimation!,
            child: TapRegion(
              onTapOutside: (PointerDownEvent pde) {
                BlocProvider.of<SettingsMenuCubit>(context).setClosed();
              },
              child: Padding(
                padding: .directional(start: 5, end: 5, top: 10, bottom: 10),
                child: RoundBackground(
                  child: Container(
                    width: widthOfMenu,
                    height: 180,
                    clipBehavior: .none,
                    decoration: BoxDecoration(
                      color: const Color(0xFFfffdf7),
                      borderRadius: .all(.circular(radiusForBlock)),
                      border: .all(
                        color: Color.fromARGB(255, 185, 185, 185),
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: .all(1),
                      child: Container(
                        clipBehavior: .none,
                        decoration: BoxDecoration(
                          borderRadius: .all(.circular(radiusForBlock - 2)),
                          border: .all(color: Color(0x40000000), width: 1.0),
                        ),
                        child: _MenuContent(),
                      ),
                    ),
                  ),
                  width: widthOfMenu,
                  height: 180,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x40000000),
                      blurRadius: boxShadowRadius * 1.0,
                      offset: Offset(0, boxShadowRadius / 2),
                    ),
                    BoxShadow(
                      color: Color(0x40000000),
                      blurRadius: boxShadowRadius * 1.0,
                      offset: Offset(0, -(boxShadowRadius * 2.0)),
                    ),
                    // BoxShadow(
                    //   color: Color(0x40000000),
                    //   blurRadius: boxShadowRadius * 1.0,
                    //   offset: Offset(1, 0),
                    // ),
                    // BoxShadow(
                    //   color: Color(0x40000000),
                    //   blurRadius: boxShadowRadius * 1.0,
                    //   offset: Offset(-1, 0),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MenuContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .directional(start: 10, end: 10, top: 10, bottom: 10),
      child: Column(
        children: [
          _MenuHeader(),
          _TextSizeButtonGroup(),
          divider(),
          _ThemeButtonGroup(),
        ],
      ),
    );
  }
}

Widget divider() => const Divider(
  height: 30,
  thickness: 0.0,
  indent: 40,
  endIndent: 40,
  color: Color.fromARGB(200, 158, 158, 158),
);

class _MenuHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .directional(start: 10, bottom: 4),
      child: Align(
        alignment: .centerStart,
        child: Text(
          'Settings',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight(700)),
        ),
      ),
    );
  }
}

class _TextSizeButtonGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      children: [
        Spacer(flex: 1),
        _Button(text: 'Small', onPressed: () {}),
        _Button(text: 'Normal', onPressed: () {}),
        _Button(text: 'Large', onPressed: () {}),
        Spacer(flex: 1),
      ],
    );
  }
}

class _ThemeButtonGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      children: [
        Spacer(flex: 1),
        _Button(text: 'Light', onPressed: () {}),
        _Button(text: 'Dart', onPressed: () {}),
        Spacer(flex: 1),
      ],
    );
  }
}

const mainBackground = Color(0xFFfffdf7);

const double radiusBorderButton = 8;

class _Button extends StatefulWidget {
  _Button({
    super.key,
    required this.text,
    required this.onPressed,
    // ignore: unused_element_parameter
    this.color = mainBackground,
    // ignore: unused_element_parameter
    this.shadowColor = const Color(0x2E000000),
    // ignore: unused_element_parameter
    this.boxShadow = const [
      BoxShadow(
        color: Color(0x40000000),
        blurRadius: radiusBorderButton,
        offset: Offset(0, radiusBorderButton / 2),
      ),
    ],
  });

  final String text;
  final VoidCallback onPressed;

  final Color color;
  final Color colorInverted = Color.fromARGB(255, 80, 80, 80);
  final Color shadowColor;
  final List<BoxShadow> boxShadow;
  TextStyle style = TextStyle(fontSize: 16, fontWeight: FontWeight(500));
  TextStyle styleInverted = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight(500),
  );

  @override
  State<_Button> createState() => _ButtonState();
}

class _ButtonState extends State<_Button> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final Size textSize = getTextSize(widget.text, widget.style);
    final Size _buttonSize = Size(
      textSize.width.ceilToDouble() + 20,
      textSize.height.ceilToDouble() * 1.6,
    );
    final depth = _buttonSize.height * 0.1;

    // print('text size is w:= ${_buttonSize.width} h:= ${_buttonSize.height}');
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) => setState(() => _isPressed = !_isPressed),
      onTapCancel: () => {},
      onTapUp: (_) {
        // setState(() => _isPressed = !_isPressed);
        if (!_isPressed) return;
        HapticFeedback.lightImpact();
        widget.onPressed();
      },
      child: Stack(
        clipBehavior: .none,
        children: [
          SizedBox(width: _buttonSize.width, height: _buttonSize.height),
          // bottom
          Positioned(
            top: depth,
            left: 0,
            right: 0,
            child: Container(
              width: _buttonSize.width,
              height: _buttonSize.height,
              clipBehavior: .none,
              decoration: BoxDecoration(
                color: widget.shadowColor,
                shape: BoxShape.rectangle,
                borderRadius: .all(.circular(radiusBorderButton)),
                boxShadow: widget.boxShadow,
              ),
            ),
          ),
          // top face, slides down when pressed
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: _buttonSize.width,
              height: _buttonSize.height,
              clipBehavior: .none,
              decoration: BoxDecoration(
                color: _isPressed ? widget.colorInverted : widget.color,
                shape: BoxShape.rectangle,
                border: BoxBorder.all(color: Color(0x2E000000), width: 1.0),
                borderRadius: .all(.circular(radiusBorderButton)),
              ),
              child: Align(
                alignment: .center,
                child: Text(
                  widget.text,
                  style: _isPressed ? widget.styleInverted : widget.style,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
