import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tplayer/page_oneline/page_oneline.dart';
import 'package:tplayer/page_oneline/player_controls/playback_speed.dart';
import 'package:tplayer/page_oneline/player_controls/settings_button.dart';
import 'package:tplayer/page_oneline/player_controls/settings_menu.dart';
import 'package:tplayer/page_oneline/round_background/round_background.dart';
import 'package:tplayer/state/playback_speed_slider.dart';
import 'package:tplayer/state/settings_menu.dart';
import 'package:tplayer/ui/button_animated.dart';
import 'package:tplayer/page_oneline/player_controls/playpause_button.dart';
import 'package:defer_pointer/defer_pointer.dart';

const playbackSpeedTapRegionObjectGroupId =
    'playback-speed-tap-region-object-group-id';

const playerContolsHeight = 150;

class PlayerControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsMenuCubit>(
          create: (BuildContext context) => SettingsMenuCubit(),
        ),
        BlocProvider<PlaybackSpeedSliderCubit>(
          create: (BuildContext context) => PlaybackSpeedSliderCubit(),
        ),
      ],
      child: DeferredPointerHandler(
        child: SizedBox(
          width: TextBlockWidth,
          height: playerContolsHeight.toDouble(),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    height: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 25,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SettingsButtonWithOnPressed(),
                        ),
                        // Backward(),
                        PlayPauseButton(),
                        // Forward(),
                        PlaybackSpeedButton(),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
              SettingsMenu(),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsButtonWithOnPressed extends StatelessWidget {
  Widget build(BuildContext context) {
    void _onPressed() {
      BlocProvider.of<SettingsMenuCubit>(context).toggleOpen();
    }

    return SettingsButton(
      key: ValueKey('settingsButtonWithOnPressed'),
      onPressed: _onPressed,
    );
  }
}
