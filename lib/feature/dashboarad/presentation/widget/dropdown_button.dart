import 'package:flutter/material.dart';

class DropDownButtonWidget {
  dropdownbutton(
      {Function(String?)? onChanged,
      List<DropdownMenuItem<String>>? item,
      String? hint,
      String? value}) {
    return DropdownButton<String>(
      items: item,
      value: value,
      isExpanded: true,
      onChanged: onChanged,
      hint: Text(hint!),
    );
  }
}

DropDownButtonWidget dropDownButton = DropDownButtonWidget();
