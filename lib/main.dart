import 'package:flutter/material.dart';
import 'package:tplayer/app/app.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'dart:ui';

void main() {
  setUrlStrategy(PathUrlStrategy());

  // Capture Flutter framework errors
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    // Log to Sentry/Crashlytics
  };

  // Capture async/platform errors
  PlatformDispatcher.instance.onError = (error, stack) {
    debugPrint("Background error captured: $error");
    return true; // Prevents app crash
  };

  runApp(const App());
}
