import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tplayer/app/details_screen.dart';
import 'package:tplayer/home/home.dart';

final GoRouter router = GoRouter(
  errorBuilder: (BuildContext context, GoRouterState state) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      router.go('/');
    });
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
  },
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
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
