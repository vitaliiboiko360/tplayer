import 'package:flutter/material.dart';
import 'package:tplayer/app/home.dart';
import 'package:go_router/go_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

final GoRouter _router = GoRouter(
  errorBuilder: (BuildContext context, GoRouterState state) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _router.go('/');
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

class DetailsScreen extends StatelessWidget {
  /// Constructs a [DetailsScreen]
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/'),
          child: const Text('Go back to the Home screen'),
        ),
      ),
    );
  }
}
