import 'package:flutter/material.dart';
import '../config/constants.dart';
class MyDrawer extends StatelessWidget {

  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Drawer(
    
  // Add a ListView to the drawer. This ensures the user can scroll
  // through the options in the drawer if there isn't enough vertical
  // space to fit everything.
  child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(color: kPrimaryLightColor, icon: Icon(Icons.arrow_back_rounded), onPressed: (){
Navigator.pop(context);
                      },),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      Text('Logo Here'),
                      Text('Name Here')
                    ],
                  ),
                  Text('Company Contact')
                ],
              ),
              decoration: BoxDecoration(
                color: kPrimaryColor,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, size: 40,),
              title: Text('First item'),
              subtitle: Text("This is the 1st item"),
              trailing: Icon(Icons.more_vert),
              onTap: () {
              },
            ),
            ListTile(
              title: Text('Second item'),
              onTap: () {
              },
            ),
            ListTile(
              title: Text('Close the menu', style: TextStyle(color: kAccentColor, fontWeight: FontWeight.w500, fontFamily: 'Muli'),),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      
);
  }
}