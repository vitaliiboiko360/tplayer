import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tplayer/page_oneline/page_oneline.dart';
import 'package:tplayer/page_oneline/player_controls/player_controls.dart';
import 'package:tplayer/page_oneline/player_controls/settings_menu.dart';
import 'package:tplayer/page_oneline/round_background/round_background.dart';
import 'package:tplayer/state/settings_menu.dart';

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
      top: -228,
      left: (TextBlockWidth - widthOfMenu) / 2,
      width: widthOfMenu,
      height: 200,
      child: Container(
        width: widthOfMenu,
        height: 200,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(),
        child: SlideTransition(
          position: _offsetAnimation!,
          child: RoundBackground(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 204, 218, 253),
                borderRadius: .circular(20),
                border: .all(
                  color: Color.fromARGB(255, 89, 140, 222),
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: .all(5),
                child: SizedBox(
                  width: 10,
                  height: 10,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: .all(
                        color: Color.fromARGB(255, 85, 228, 3),
                        width: 1.0,
                      ),
                    ),
                    child: Text('Menu'),
                  ),
                ),
              ),
            ),
            width: widthOfMenu,
            height: 190,
          ),
        ),
      ),
    );
  }
}
