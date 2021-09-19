import '../config/import.dart';

class AddTask extends StatefulWidget{
const AddTask({Key? key}): super(key:key);


@override
_AddTaskState createState() => _AddTaskState();


}

class _AddTaskState extends State<AddTask> {



@override
Widget build(BuildContext context)=>
SafeArea(child: Scaffold(
  floatingActionButton: FloatingActionButton(child: Icon(Icons.save), onPressed: (){}, backgroundColor: kAccentColor, foregroundColor: kPrimaryLightColor,),
  appBar: AppBar(
    leading: Icon(Icons.close),
    actions:[
      Icon(Icons.check)
    ]
  ),
  body: Container(
    child:Stack(
      children: [
        Center(child: Text('Add Task'),),

      ],
    )
  ),
));
}
