
import 'package:flutter/services.dart';
import '../config/import.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  
static final String title = 'Taju';
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);

        return MaterialApp(
    debugShowCheckedModeBanner:false,
          title: title,
          themeMode: themeProvider.themeMode,
          darkTheme: MyThemes().darkTheme(),
          theme:MyThemes().lightTheme(),
          home: HijiriCalendar(),
        );
      }
    );
  }
}
