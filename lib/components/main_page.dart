import '../config/import.dart';

import '../main.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  static final List<Map<String, dynamic>> _popupMenuItem = [
    {
      'page':'Add Task',
      'value':0,
      'icon': Icon(Icons.add_task_sharp),
    },{
      'page':'Alarm',
      'icon': Icon(Icons.add_alarm_sharp),
      'value':1,
    },
    {
      'page':'Exit App',
      'icon': Icon(Icons.exit_to_app_sharp),
      'value':2,
    }

  ];




  @override
  Widget build(BuildContext context)

   => SafeArea(

    child: Scaffold(
      drawer: MyDrawer(),
      // floatingActionButton: FloatingActionButton(child: Icon(Icons.add_task_outlined),
      // backgroundColor: kPrimaryColor,
      // foregroundColor: kPrimaryLightColor,
      // onPressed: ()=>{}, ),
      appBar: AppBar(centerTitle: true,
      title: Text(MyApp.title, style: TextStyle(fontSize: 16, fontFamily: 'Muli'),),
      actions: [
        PopupMenuButton(icon: Icon(Icons.more_vert_sharp, size: 28,),
        color: kPrimaryDarkColor,
        itemBuilder: (context)=>
        _popupMenuItem.map((item)=>PopupMenuItem<int>(child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            item['icon'] as Widget,
            Text(item['page'],),


          ],
        ), value:item['value'],)).toList(),

        onSelected: (val){

          switch(val){
            case 0 : print('add task');
            break;
            case 1 : print('add alarm');
            break;
            case 2 : print('exit app');
            break;
          }

        },
        onCanceled: ()=>{
          print('cancelled')
        },


        )
      ],

      ),
      body: HijiriCalendar(),

    ),
  );

}

