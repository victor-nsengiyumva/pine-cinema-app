import 'package:flutter/material.dart';
import 'package:pine/utils/custom_theme.dart';

import 'app_pages/Widgets_show.dart';
import 'bottom_nav_bar/nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pine Cinema',
      theme: lightThemeData(context),
        darkTheme: darkThemeData(context),
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
      home: NavBar(),
    );
  }
}

