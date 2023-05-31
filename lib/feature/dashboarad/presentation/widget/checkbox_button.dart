import 'package:bookapp/feature/dashboarad/domain/entities/screen_resolution.dart';
import 'package:flutter/material.dart';

class CheckBoxButton {
  checkbox({value, Function(bool?)? onChanged, title}) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
        screenResolution.mediumspacerow,
        Text(title)
      ],
    );
  }
}
