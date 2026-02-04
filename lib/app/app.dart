import 'package:flutter/material.dart';
import 'package:tplayer/app/details_screen.dart';
import 'package:tplayer/home/home.dart';
import 'package:go_router/go_router.dart';
import 'package:tplayer/router/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
