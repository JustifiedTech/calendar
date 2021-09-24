
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/import.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
static final String title = 'JTech Calendar';
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        return MaterialApp(
    debugShowCheckedModeBanner:false,
          title: title,
          themeMode: ThemeMode.dark,
          darkTheme: MyThemes().darkTheme(),
          theme:MyThemes().lightTheme(),
          home: HijiriCalendar(),
        );
      }
    );
  }
}
