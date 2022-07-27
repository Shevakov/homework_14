import 'package:flutter/material.dart';

import 'widgets/state_holder.dart';
import 'widgets/weather_indicator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool selected = false;

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
      body: SizedBox(
        width: 400,
        height: 450,
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(seconds: 2),
              curve: Curves.easeIn,
              top: selected ? 250 : 70,
              right: selected ? 50 : -50,
              child: AnimatedScale(
                duration: const Duration(seconds: 2),
                scale: selected ? 1.5 : 1,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = !selected;
                    });
                  },
                  child: CustomPaint(
                    size: const Size(200, 200),
                    painter: WeatherIndicator(0.9, selected),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
