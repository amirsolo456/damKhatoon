import 'package:flutter/material.dart';

class ThemeConfig {
  final ThemeMode themeMode;
  final Color primaryColor;
  final Color secondaryColor;

  ThemeConfig({
    this.themeMode = ThemeMode.light,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.green,
  });

  ThemeConfig copyWith({
    ThemeMode? themeMode,
    Color? primaryColor,
    Color? secondaryColor,
  }) {
    return ThemeConfig(
      themeMode: themeMode ?? this.themeMode,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
    );
  }
}