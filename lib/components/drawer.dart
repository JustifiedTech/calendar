import '../config/import.dart';

class MyDrawer extends StatefulWidget {

  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
bool isTask = false;
bool isAlarm = false;

  @override
  Widget build(BuildContext context) {

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
                        child: Icon(Icons.person, size: 30,)),
                      InkWell(child: Icon(Icons.arrow_back_sharp, color:Colors.white,), onTap: ()=>{
                        Navigator.pop(context)
                      },)
                    ],
                  ),
                  Text('JTech Calender', style: TextStyle( color:Colors.white, fontFamily: 'Muli', fontWeight: FontWeight.bold, fontSize: 28),),
                  Row(

                    children: [
                      Icon(Icons.mail, size: 14, color: Colors.white,),
                        SizedBox(width: 10,),

                      Text('JustifiedTech@gmail.com', style: TextStyle(color: Colors.white),),

                    ],
                  ),
                    Row(
                      children: [
                        Icon(Icons.phone, size: 14,color: Colors.white),
                        SizedBox(width: 10,),
                      Text('+234-703-783-7788', style: TextStyle(color: Colors.white))

                      ],
                    ),
                ],
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),

           MyListTile(icon:Icons.calendar_view_day_sharp, title: 'Day', onTap: () => {print('Day View')}, subtitle: '',),
           MyListTile(icon:Icons.calendar_view_week_sharp, title: 'Week', subtitle: '', onTap: () => {print('week View')}),
           MyListTile(icon:Icons.calendar_view_month_sharp, title: 'Month', subtitle: '', onTap: () => {print('month View')}),

            Divider(height: 5, color: Theme.of(context).accentColor,),
            Container(
              child: Row(
                  children: [
               Checkbox(
                        activeColor: Theme.of(context).primaryColor,
                        value: isTask,
                        onChanged: (val) {
                          setState(() {
                            isTask = val!;
                          });
                        },
                      ),
                      InkWell(
                    onTap: () {
                      setState(() {
                        isTask = !isTask;
                        if(isTask){
                        print('Task displayed');
                      }
                      else{
                        print('Task display off');
                      }
                      });

                    },
                    child: Text(
                      'Tasks',
                      style: TextStyle(
                          fontSize:14,
                          color: isTask == true ? Theme.of(context).accentColor : Colors.white),
                    ),
                  ),
  ],
),
            ),
            Row(
               children: [
             Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                      value: isAlarm,
                      onChanged: (val) {
                        setState(() {
                          isAlarm = val!;
                           if(isAlarm){
                      print('Alarm displayed');
                    }
                    else{
                      print('Alarm display off');
                    }
                        });

                      },
                    ),
                    InkWell(
                  onTap: () {
                    setState(() {
                      isAlarm = !isAlarm;
                    });
                  },
                  child: Text(
                    'Reminder',
                    style: TextStyle(
                        fontSize:14,
                        color: isAlarm == true ? Theme.of(context).accentColor:Colors.white),
                  ),
                ),
  ],
),
            Divider(height: 5, color: kAccentColor,),

           MyListTile(icon:Icons.settings, title: 'Settings', subtitle: 'Display Settings',),

          ],
        ),

);
  }
}

class MyListTile extends StatelessWidget {
  const MyListTile({
    Key? key, required this.icon, this.subtitle, this.title, this.onTap
  }) : super(key: key);

  final String? title, subtitle;
  final IconData icon;
  final Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,),
       title: Text(title!, style: TextStyle(fontFamily:'Muli', fontSize: 16,  fontWeight: FontWeight.bold),),
       subtitle: Text(subtitle!, style: TextStyle(fontSize: 12),),
      //  trailing: Icon(Icons.arrow_drop_down),
onTap: onTap,
     );
  }
}