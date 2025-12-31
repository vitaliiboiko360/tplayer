import 'package:flutter/material.dart';
import 'package:tplayer/app/app.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const App());
}
