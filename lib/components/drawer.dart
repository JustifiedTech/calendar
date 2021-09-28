import '../config/import.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  List<String> themes = ['System', 'Dark', 'Light'];
  List<String> days = ['We', 'Fe'];

  Future<void> _contact(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                        radius: 20,
                        child: Icon(
                          Icons.person,
                          size: 30,
                        )),
                    InkWell(
                      child: Icon(
                        Icons.arrow_back_sharp,
                        color: Colors.white,
                      ),
                      onTap: () => {Navigator.pop(context)},
                    )
                  ],
                ),
                SelectableText(
                  'JTech Calendar',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Muli',
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
                GestureDetector(
                  onTap: () => _contact(
                      'mailto:justifiedtechnologies.com@gmail.com?subject=Enquiries&body=Your Message Here'),

                  child: Row(
                    children: [
                      Icon(
                        Icons.mail,
                        size: 14,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'JustifiedTech@gmail.com',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => _contact('tel:07037837788'),
                  child: Row(
                    children: [
                      Icon(Icons.phone, size: 14, color: Colors.white),
                      SizedBox(
                        width: 10,
                      ),
                      Text('+234-703-783-7788',
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          Divider(
            height: 5,
            color: Theme.of(context).accentColor,
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            trailing: Icon(Icons.arrow_drop_down_sharp),
          ),
          Divider(
            height: 3,
            color: Theme.of(context).accentColor,
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Show week number'),
                Switch.adaptive(
                    activeColor: Theme.of(context).accentColor,
                    value: themeProvider.isOn,
                    onChanged: (value) async {
                      final provider =
                          Provider.of<ThemeProvider>(context, listen: false);
                      SharedPreferences _prefs =
                          await SharedPreferences.getInstance();
                      _prefs.setBool('showWeek', value);

                      provider.showWeek(value);
                    })
              ],
            ),
          ),
          Divider(
            height: 5,
            color: Theme.of(context).accentColor,
          ),
       
          ListTile(
            title: Text('Theme'),
            subtitle: Text(themeProvider.currentTheme),
            onTap: () => _changeThemeDialog(context),
          ),
          Divider(
            height: 5,
            color: Theme.of(context).accentColor,
          ),
          ListTile(
            title: Text('First day of the week'),
            subtitle: Text(themeProvider.currentFirstDay.toString()),
            onTap: () => _changeFirstDayDialog(context),
          ),
          Divider(
            height: 5,
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }

  _changeThemeDialog(BuildContext context) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              key: ValueKey(1),
              content: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...themes
                        .map((theme) => RadioListTile<String>(
                            title: Text(theme),
                            activeColor: Theme.of(context).accentColor,
                            value: theme,
                            groupValue: provider.currentTheme,
                            selected: provider.currentTheme == theme,
                            onChanged: (value) async {
                              _prefs.setString('theme', value.toString());
                              provider.changeTheme(value.toString());
                              Navigator.of(context).pop();
                            }))
                        .toList()
                  ],
                ),
              ),
            ));
  }

  _changeFirstDayDialog(BuildContext context) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              key: ValueKey(2),
              content: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...days
                        .asMap()
                        .entries
                        .map((day) => RadioListTile<String>(
                            title: Text(day.value),
                            activeColor: Theme.of(context).accentColor,
                            value: day.value,
                            groupValue: provider.currentFirstDay,
                            selected: provider.currentFirstDay == day.value,
                            onChanged: (value) async {
                              _prefs.setString('firstDay', value.toString());
                              provider.firstDayToggle(value.toString());
                              Navigator.of(context).pop();
                            }))
                        .toList()
                  ],
                ),
              ),
            ));
  }
}
