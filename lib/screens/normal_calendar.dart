
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MyCalendar extends StatefulWidget {
  MyCalendar({Key? key}) : super(key: key);

  @override
  _MyCalendarState createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view:CalendarView.month,
      initialSelectedDate: DateTime.now(),
      cellBorderColor: Colors.transparent,
      showCurrentTimeIndicator: true,
      showNavigationArrow: true,
      showDatePickerButton: true,
      showWeekNumber: true,
weekNumberStyle: WeekNumberStyle(backgroundColor: Colors.deepOrange,textStyle: TextStyle(color: Colors.white)),
    );
}
}