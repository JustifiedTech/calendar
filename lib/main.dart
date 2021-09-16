
import 'package:flutter/material.dart';
import '../config/import.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
static final String title = 'JTech Calendar';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: title,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryDarkColor,
        accentColor: kAccentColor,
        primaryColor: kPrimaryColor,
        ),
        // theme: themeData(),
      home: MainPage(),
    );
  }
}
