import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tplayer/data/domain_models/text_title.dart';
import 'package:tplayer/state_bloc/page_text_catalog_list_texts.dart';

class Catalog extends StatefulWidget {
  @override
  State<Catalog> createState() => CatalogState();
}

class CatalogState extends State<Catalog> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PageTextCatalogListTextsModel>(context)
        .add(GetTextTitlesEvent());
    return BlocBuilder<PageTextCatalogListTextsModel, List<TextTitleDataModel>>(
      builder: (BuildContext context, listTextTitleDataModels) {
        return ListView(
          children: listTextTitleDataModels
              .map((e) => Center(child: TextTitle(e.title)))
              .toList(),
        );
      },
    );
  }
}

class TextTitle extends StatefulWidget {
  TextTitle(this.title);
  String title;
  @override
  State<StatefulWidget> createState() => _TextTitleState();
}

class _TextTitleState extends State<TextTitle> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 50, child: Container(child: Text(widget.title)));
  }
}
