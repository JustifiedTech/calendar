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
  // floatingActionButton: FloatingActionButton(child: Icon(Icons.save), onPressed: (){}, backgroundColor: Theme.of(context).accentColor, foregroundColor: kPrimaryLightColor,),
  appBar: AppBar(
    title: Text('Setting'), centerTitle: true,
    actions:[
      // Icon(Icons.check)
    ]
  ),
  body: Container(
    child:Stack(
      children: [
        Center(
              child: Text('Setting'),
            ),

      ],
    )
  ),
));
}
