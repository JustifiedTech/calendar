import '../config/import.dart';
List<String> daysName = ['FE', 'DI', 'ZO  ', 'WO  ', 'BY', 'TS', 'WE'];
List<String> monthsName = ['','Jonwoju', 'Jenza', 'Natswi', 'Zawi', 'Chukone', 'Di', 'Sonfa', 'Ane', 'Gben-Yo', 'Aye', 'Weku', 'Kenuju'];
List<Map<String, dynamic>> popupMenuItem =
  [
    {
      'page':'Add Task',
      'value':0,
      'icon': Icon(Icons.add_task_sharp),
    },
    {
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