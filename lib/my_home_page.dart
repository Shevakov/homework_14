import 'package:flutter/material.dart';

import 'widgets/state_holder.dart';
import 'widgets/sun.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MaterialColor? color = Colors.blue;
  List<MaterialColor> colorsApp = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.cyan,
    Colors.deepPurple,
  ];

  void _changeColor(MaterialColor color) {
    StateHolderState wrapper = StateHolder.of(context);
    wrapper.changeColor(color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          ...colorsApp.map((col) {
            return ListTile(
              textColor: col,
              title: Text(col.value.toString()),
              leading: Radio<MaterialColor>(
                value: col,
                groupValue: color,
                onChanged: (MaterialColor? value) {
                  setState(() {
                    color = value;
                    _changeColor(color!);
                  });
                },
              ),
            );
          }).toList()
        ],
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomPaint(
              painter: Sun(),
              size: const Size(300, 300),
            ),
          ],
        ),
      ),
    );
  }
}
