import 'package:flutter/material.dart';

import 'widgets/custom_text.dart';
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
  double _currentSliderValue = 1;

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
        height: 650,
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
                  child: Stack(children: [
                    CustomPaint(
                      size: const Size(200, 200),
                      painter: WeatherIndicator(_currentSliderValue),
                    ),
                    selected
                        ? const Positioned(
                            top: 100,
                            child: CustomText(
                              blur: 5,
                              color: Color(0xFF477C70),
                              offset: Offset(5, 5),
                              child: Text(
                                'Облачно,\n12 градусов',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 26),
                              ),
                            ),
                          )
                        : const Text(''),
                  ]),
                ),
              ),
            ),
            Positioned(
                width: 400,
                bottom: 0,
                child: Slider(
                  value: _currentSliderValue,
                  max: 1,
                  divisions: 10,
                  label: _currentSliderValue.toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                )),
          ],
        ),
      ),
    );
  }
}
