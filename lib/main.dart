import 'package:calendar/screens/hijiri_calendar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
static final String title = 'Hijiri Calendar made \nJustifiedTech(Kcslim)';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black12,
        accentColor: Colors.deepOrangeAccent,
        primaryColor: Colors.deepOrange,
      
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
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add_task_outlined),
      backgroundColor: Colors.deepOrange,
      foregroundColor: Colors.white,
      onPressed: ()=>{}, ),
      appBar: AppBar(centerTitle: true, 
      title: Text(MyApp.title, style: TextStyle(fontSize: 14),),
      leading: Icon(Icons.settings),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.add_task_rounded),
        )
      ],),
      body: HijiriCalendar(),
    ),
  );
   
}