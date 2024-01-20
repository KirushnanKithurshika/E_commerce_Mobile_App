import 'package:flutter/material.dart';
class TChipTheme {
  TChipTheme._();
  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: Colors.cyan,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: Colors.white,
  );
  static ChipThemeData darkChipTheme = const ChipThemeData(
  disabledColor: Colors.grey,
  labelStyle: TextStyle (color: Colors.white),
  selectedColor: Colors.cyan,
  padding: EdgeInsets.symmetric (horizontal: 12.0, vertical: 12),
  checkmarkColor: Colors.white,
  );
}