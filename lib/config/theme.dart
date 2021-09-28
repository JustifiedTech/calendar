import '../config/import.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  int firstDay = 1;
  bool showWeekNumber = true;

  bool get isOn => showWeekNumber;

  String get currentTheme => themeMode == ThemeMode.dark
      ? 'Dark'
      : themeMode == ThemeMode.light
          ? 'Light'
          : 'System';

  String get currentFirstDay => firstDay == 1 ? 'Fe' : 'We';

  void showWeek(bool isTrue) {
    showWeekNumber = isTrue ? true : false;
    notifyListeners();
  }

  void changeTheme(String value) {
    switch (value) {
      case 'System':
        themeMode = ThemeMode.system;
        break;
      case 'Light':
        themeMode = ThemeMode.light;
        break;
      case 'Dark':
        themeMode = ThemeMode.dark;
        break;
    }
    notifyListeners();
  }

  void firstDayToggle(String value) {
    firstDay = (value == 'Fe') ? 1 : 7;
    notifyListeners();

  }
}

class MyThemes {
  ThemeData lightTheme() {
    return ThemeData(
        fontFamily: 'Muli',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
        accentColor: Colors.deepPurpleAccent,
        primaryColor: Colors.deepPurple,
        colorScheme: ColorScheme.light(),
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black));
  }

  ThemeData darkTheme() {
    return ThemeData(
        fontFamily: 'Muli',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: kPrimaryDarkColor,
        accentColor: kAccentColor,
        primaryColor: kPrimaryColor,
        colorScheme: ColorScheme.dark(),
        brightness: Brightness.dark,
        iconTheme: IconThemeData(color: Colors.white));
  }
}
