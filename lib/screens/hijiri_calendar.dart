
import 'package:calendar/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/core.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class HijiriCalendar extends StatefulWidget {
  HijiriCalendar({Key? key}) : super(key: key);

  @override
  _HijiriCalendarState createState() => _HijiriCalendarState();
}

class _HijiriCalendarState extends State<HijiriCalendar> {

   HijriDatePickerController _controller = HijriDatePickerController();

@override
  Widget build(BuildContext context) {
    return Card(
borderOnForeground:true,
      
elevation: 10,
       margin: const EdgeInsets.fromLTRB(10, 20, 10, 50),
      child: SfHijriDateRangePicker(
        view: HijriDatePickerView.month,
        showNavigationArrow: true,
        // showActionButtons: true,
        controller: _controller,
        selectionMode: DateRangePickerSelectionMode.single,
        selectionShape: DateRangePickerSelectionShape.circle,
        viewSpacing: 30,
        minDate: HijriDateTime(1440, 02, 05),
        maxDate: HijriDateTime(1448, 12, 05),
        monthViewSettings: HijriDatePickerMonthViewSettings(
        showWeekNumber: true,
        specialDates: <HijriDateTime>[
          HijriDateTime.now().add(Duration(days: 2)),
          HijriDateTime.now().add(Duration(days: 25)),
          HijriDateTime.now().add(Duration(days: 7)),
          HijriDateTime.now().add(Duration(days: 16))
        ],
        weekNumberStyle: DateRangePickerWeekNumberStyle(
                textStyle: TextStyle(fontStyle: FontStyle.italic),
                backgroundColor: kPrimaryColor),
                 dayFormat: 'EEE',
                    viewHeaderStyle: DateRangePickerViewHeaderStyle(backgroundColor: Color(0xFF000F1F))),
                headerStyle:
                    DateRangePickerHeaderStyle(backgroundColor: Color(0xFF000F1F)),
                monthCellStyle: HijriDatePickerMonthCellStyle(
          blackoutDatesDecoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(color: const Color(0xFFF44436), width: 1),
              shape: BoxShape.circle),
          weekendDatesDecoration: BoxDecoration(
              color: const Color(0xFF000F1F),
              border: Border.all(color: const Color(0xFF000F1F), width: 1),
              shape: BoxShape.circle),
          specialDatesDecoration: BoxDecoration(
              color: Colors.green,
              border: Border.all(color: const Color(0xFF2B732F), width: 1),
              shape: BoxShape.circle),
          blackoutDateTextStyle: TextStyle(
              color: Colors.white, decoration: TextDecoration.lineThrough),
          specialDatesTextStyle: const TextStyle(color: Colors.white),
        ),
      
      ),
    );
}
}