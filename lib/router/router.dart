import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tplayer/app/details_screen.dart';
import 'package:tplayer/home/home.dart';

final GoRouter router = GoRouter(
  errorBuilder: (BuildContext context, GoRouterState state) {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   router.go('/');
    // });
    return MaterialApp(
      title: 'ERROR BUILDER',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 243, 5, 5),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 20.0,
            color: Color.fromARGB(255, 245, 11, 11),
            fontWeight: FontWeight.normal,
          ),
          // You can define other styles like headlineLarge, etc.
        ),
      ),
      home: const HomePage(),
    );
  },
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return Scaffold(
          appBar: AppBar(title: Text('Text Player Route /'), centerTitle: true),
          body: const HomePage(),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const DetailsScreen();
          },
        ),
      ],
    ),
  ],
);
