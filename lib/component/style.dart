import 'package:flutter/material.dart';

import '../utils/colors.dart';

InputDecoration textFieldDecoration() {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
    hintStyle: TextStyle(color: myColor.textHintColor),
    border: OutlineInputBorder(borderSide: BorderSide.none),
  );
}

BoxDecoration roundDecoration() {
  return BoxDecoration(color: myColor.secondColor, borderRadius: BorderRadius.circular(8));
}