import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HandleError {
  static Widget materialerror(context, widget) {
    Widget error = const Text('...rendering error...');
    if (widget is Scaffold || widget is Navigator) {
      error = Scaffold(body: Center(child: error));
    }
    ErrorWidget.builder = (errorDetails) => error;
    if (widget != null) return widget;
    throw ('widget is null');
  }

  static exit1() {
    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      if (kReleaseMode) exit(1);
    };
  }
}
