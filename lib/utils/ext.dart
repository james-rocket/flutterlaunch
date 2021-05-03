/// Here is where the generally used extensions for IR are stored.
/// We can extract them to different files later if needed.

import 'package:flutter/material.dart';

/// The utility extensions for the build context.
extension BuildContextUtils on BuildContext {
  /// Get the color scheme.
  ColorScheme color() => Theme.of(this).colorScheme;

  /// Get the text theme.
  TextTheme text() => Theme.of(this).textTheme;

  /// Get the primary theme color.
  Color primaryColor() => Theme.of(this).primaryColor;

  /// Get the primary light theme color.
  Color primaryLight() => Theme.of(this).primaryColorLight;

  /// Get the primary light theme color.
  Color primaryDark() => Theme.of(this).primaryColorDark;

  /// Get the divider theme color.
  Color dividerColor() => Theme.of(this).dividerColor;

  /// Get the divider theme color.
  Color shadowColor() => Theme.of(this).shadowColor;

}

/// The utility extension for use on String.
extension StringUtils on String? {

  /// Not null and not empty ext.
  bool notNullNotEmpty() => this != null && this!.isNotEmpty;

  /// Not null and not empty ext.
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

/// The utility extension for use on String.
extension ListUtils on List? {
  /// Not null and not empty ext.
  bool notNullNotEmpty() => this != null && this!.isNotEmpty;
}
