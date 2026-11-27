import 'package:flutter/material.dart';
import 'package:tplayer/page_text_catalog/catalog/catalog.dart';
import 'package:go_router/go_router.dart';

class PageTextCatalog extends StatefulWidget {
  const PageTextCatalog({super.key});

  final String title = 'Text Player';

  @override
  State<PageTextCatalog> createState() => _PageTextCatalogState();
}

class _PageTextCatalogState extends State<PageTextCatalog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   centerTitle: true,
      //   forceMaterialTransparency: true,
      //   toolbarHeight: 60,
      //   title: Row(
      //     mainAxisAlignment: .center,
      //     spacing: 10,
      //     children: [
      //       Text('Name of the story'),
      //       Padding(padding: .directional(start: 50), child: SizedBox.shrink()),
      //     ],
      //   ),
      // ),
      body: Center(child: Catalog()),
      floatingActionButton: Stack(
        children: [
          Align(
            alignment: .topStart,
            child: Padding(
              padding: .all(50),
              child: IconButton(
                onPressed: () => context.go('/'),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.fromMap({
                    WidgetState.any: Theme.of(context).colorScheme.primary
                        .withValues(alpha: .08),
                  }),
                ),
                icon: Icon(Icons.arrow_back),
                // child: Text('Text Button'),
              ),
            ),
          ),
          Align(
            alignment: .bottomRight,
            child: Padding(
              padding: .all(20),
              child: Text(
                '${to2(MediaQuery.sizeOf(context).width)} x ${to2(MediaQuery.sizeOf(context).height)} |${to2(MediaQuery.devicePixelRatioOf(context))}| ~~ ${to2(MediaQuery.sizeOf(context).aspectRatio)}',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Function to2 = (double inputNumber) => (inputNumber * 100).truncate() / 100;
