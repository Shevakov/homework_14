import 'package:flutter/material.dart';
import 'theme_app.dart';

class StateHolder extends StatefulWidget {
  final Widget child;

  const StateHolder({Key? key, required this.child}) : super(key: key);

  static StateHolderState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ThemeApp>())!.state;
  }

  @override
  State<StatefulWidget> createState() => StateHolderState();
}

class StateHolderState extends State<StateHolder> {
  MainTheme mainTheme = MainTheme(mainColor: Colors.red);

  void changeColor(MaterialColor color) {
    setState(() {
      mainTheme = MainTheme(mainColor: color);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeApp(theme: mainTheme, state: this, child: widget.child);
  }
}
