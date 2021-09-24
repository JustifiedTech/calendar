import '../config/import.dart';


class ThemeProvider extends ChangeNotifier {
ThemeMode themeMode = ThemeMode.dark;

bool get isDark => themeMode == ThemeMode.dark;

}


class MyThemes{


ThemeData lightTheme() {
  return ThemeData(
      fontFamily: 'Muli',

      // appBarTheme: appBarTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: Colors.white,
      accentColor: Colors.deepOrangeAccent,
      primaryColor: Colors.deepPurple,
      colorScheme: ColorScheme.light(),
      brightness: Brightness.light,

      );
}
ThemeData darkTheme() {
  return ThemeData(
      fontFamily: 'Muli',
      // textTheme: textTheme(),
      // appBarTheme: appBarTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: kPrimaryDarkColor,
      accentColor: kAccentColor,
      primaryColor: kPrimaryColor,
      colorScheme: ColorScheme.dark(),
      brightness: Brightness.dark,
      textTheme: Typography.whiteMountainView


      );
}

// AppBarTheme appBarTheme() {
//   return AppBarTheme(

//       elevation: 0,
//       brightness: Brightness.light,
//       iconTheme: IconThemeData(
//         color: kPrimaryLightColor,
//       ),
//       textTheme: TextTheme(

//           headline6: TextStyle(
//             fontFamily: 'Muli',
//               color: kTextTheme, fontSize: 20, fontWeight: FontWeight.bold)));
// }

// TextTheme textTheme() {
//   return TextTheme(

//     bodyText1: TextStyle(color: kTextColor, fontFamily: 'Muli'),
//     bodyText2: TextStyle(color: kTextColor, fontFamily: 'Muli'),
//   );
// }
}