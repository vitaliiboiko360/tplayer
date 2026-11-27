import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tplayer/app/details_screen.dart';
import 'package:tplayer/data/repositories/content_repository.dart';
import 'package:tplayer/page_home/home.dart';
import 'package:tplayer/page_oneline/page_oneline.dart';
import 'package:tplayer/page_text/page_text.dart';
import 'package:tplayer/page_text_catalog/page_text_catalog.dart';
import 'package:tplayer/state_bloc/page_text_catalog_list_texts.dart';
import 'package:tplayer/state_bloc/page_text_list_textlines.dart';

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
        return HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const DetailsScreen();
          },
        ),
        GoRoute(
          path: 'oneline',
          builder: (BuildContext context, GoRouterState state) {
            return const PageOneLine();
          },
        ),
        GoRoute(
          path: 'stories',
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              create: (BuildContext context) {
                return PageTextCatalogListTextsModel(
                  RepositoryProvider.of<ContentHttpRepository>(context),
                );
              },
              child: PageTextCatalog(),
            );
          },
        ),
        GoRoute(
          path: 'story',
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              create: (BuildContext context) {
                return PageTextListTextLinesViewModel(
                  RepositoryProvider.of<ContentHttpRepository>(context),
                );
              },
              child: PageText(),
            );
          },
        ),
      ],
    ),
  ],
);
