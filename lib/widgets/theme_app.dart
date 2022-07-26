import 'package:flutter/material.dart';

import 'state_holder.dart';

class ThemeApp extends InheritedWidget {
  final MainTheme theme;
  final StateHolderState state;

  const ThemeApp({
    required this.theme,
    required this.state,
    required Widget child,
    Key? key,
  }) : super(child: child, key: key);

  static MainTheme of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<ThemeApp>();
    if (result == null) throw Exception('MainTheme not found');
    return result.theme;
  }

  @override
  bool updateShouldNotify(ThemeApp oldWidget) => theme != oldWidget.theme;
}

class MainTheme {
  final MaterialColor mainColor;

  MainTheme({
    required this.mainColor,
  });
}
