import 'package:flutter/material.dart';
import 'package:tplayer/app/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Player',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 168, 168, 168),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
          // You can define other styles like headlineLarge, etc.
        ),
      ),
      home: const HomePage(),
    );
  }
}
