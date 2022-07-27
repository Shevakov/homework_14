import 'package:flutter/material.dart';

import 'my_home_page.dart';
import 'widgets/state_holder.dart';
import 'widgets/theme_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateHolder(
      child: Builder(builder: (innerContext) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: ThemeApp.of(innerContext).mainColor,
              scaffoldBackgroundColor: Colors.black),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      }),
    );
  }
}
