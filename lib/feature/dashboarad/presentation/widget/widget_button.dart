import 'package:flutter/material.dart';

class WidgetButton {
  button({Function()? onPressed, title, required bool isExpanded}) {
    return !isExpanded
        ? SizedBox(
            height: 50,
            child: ElevatedButton(onPressed: onPressed, child: Text(title)))
        : Expanded(
            child: SizedBox(
                height: 50,
                child:
                    ElevatedButton(onPressed: onPressed, child: Text(title))));
  }
}

WidgetButton widgetButton = WidgetButton();
