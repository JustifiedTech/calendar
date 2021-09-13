import 'package:flutter/material.dart';

import '../screens/hijiri_calendar.dart';
import 'components/drawer.dart';
import 'config/constants.dart';
import 'config/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
static final String title = 'Hijiri Calendar made \nJustifiedTech(Kcslim)';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: themeData(),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryDarkColor,
        accentColor: kAccentColor,
        primaryColor: kPrimaryColor,
      
        
     ),
      home: MainPage(),
    );
  }
}
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add_task_outlined),
      backgroundColor: kPrimaryColor,
      foregroundColor: kPrimaryLightColor,
      onPressed: ()=>{}, ),
      appBar: AppBar(centerTitle: true, 
      title: Text(MyApp.title, style: TextStyle(fontSize: 14),),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.add_task_rounded),
        )
      ],
    
      ),
      body: HijiriCalendar(),
      
    ),
  );
   
}

