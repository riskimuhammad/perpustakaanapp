import 'package:flutter/material.dart';

class TextFormFieldWidget {
  field({
    TextEditingController? controller,
    String? Function(String?)? validator,
    String? hintText,
    int? maxLength,
    int? maxLines,
    bool? enable,
  }) {
    return TextFormField(
      enabled: enable,
      maxLength: maxLength,
      maxLines: maxLines,
      style: enable == false ? TextStyle(color: Colors.grey) : null,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      controller: controller,
      validator: validator,
    );
  }
}

TextFormFieldWidget textFormField = TextFormFieldWidget();
