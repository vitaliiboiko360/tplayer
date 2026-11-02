import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tplayer/page_oneline/page_oneline.dart';
import 'package:tplayer/page_oneline/player_controls/player_controls.dart';
import 'package:tplayer/page_oneline/player_controls/settings_menu.dart';
import 'package:tplayer/page_oneline/round_background/round_background.dart';
import 'package:tplayer/state/settings_menu.dart';

const boxShadowRadius = 5;

class SettingsMenu extends StatefulWidget {
  const SettingsMenu({super.key});

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
      child: Container(
        width: TextBlockWidth,
        height: 220,
        clipBehavior: .antiAlias,
        decoration: BoxDecoration(),
        child: SlideTransition(
          position: _offsetAnimation!,
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
                  padding: .all(5),
                  child: Container(
                    clipBehavior: .none,
                    decoration: BoxDecoration(
                      borderRadius: .all(.circular(radiusForBlock)),
                      border: .all(
                        color: Color.fromARGB(255, 85, 228, 3),
                        width: 1.0,
                      ),
                    ),
                    child: SizedBox(
                      width: 10,
                      height: 10,
                      child: Align(
                        child: Text(
                          'Menulongwordstringlongwordstringlongwordstringlongwordstring',
                        ),
                      ),
                    ),
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
    );
  }
}
