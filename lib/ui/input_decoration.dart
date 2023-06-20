import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    required String hintText,
  }) {
    return InputDecoration(
      focusedBorder:
          const OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
