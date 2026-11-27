import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tplayer/app/details_screen.dart';
import 'package:tplayer/data/repositories/content_repository.dart';
import 'package:tplayer/data/services/content_client.dart';
import 'package:tplayer/page_home/home.dart';
import 'package:go_router/go_router.dart';
import 'package:tplayer/router/router.dart';
import 'package:flutter/rendering.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;

    return RepositoryProvider(
      create: (_) {
        final ContentClientService contentClientService =
            ContentClientService();
        return ContentHttpRepository(contentClient: contentClientService);
      },
      dispose: (_) => {},
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 168, 168, 168),
            surface: Colors.transparent,
          ),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontFamily: 'Fredoka',
            ),
            // You can define other styles like headlineLarge, etc.
          ),
        ),
      ),
    );
  }
}
