
import 'dart:ui';
import '../config/import.dart';
import 'package:dart_style/dart_style.dart';

class HijiriCalendar extends StatefulWidget {
  HijiriCalendar({Key? key}) : super(key: key);

  @override
  _HijiriCalendarState createState() => _HijiriCalendarState();
}

class _HijiriCalendarState extends State<HijiriCalendar> {

   HijriDatePickerController _controller = HijriDatePickerController();




HijriDateTime _minDate = HijriDateTime.fromDateTime(DateTime(2021, 01, 01));
HijriDateTime _maxDate = HijriDateTime.fromDateTime(DateTime(2021, 12, 31));



  //  final HijriDateTime anyDate = HijriDateTime.fromDateTime(DateTime(2021, 9, 15));

  //  final DateTime today = HijriDateTime.now().toDateTime();


  ///                                                           DateTime.now))
void controllerF(){
  // _controller.addPropertyChangedListener(() { })
  _controller.displayDate = HijriDateTime(2022, 02, 09);
}

@override
void initState() {
// controllerF();
    super.initState();
  }

@override
  Widget build(BuildContext context) {
    print(_minDate);
    print(_maxDate);
    return Stack(
      children: [
        SfHijriDateRangePicker(
          view: HijriDatePickerView.month,
          showNavigationArrow: true,
          // showActionButtons: true,
          toggleDaySelection: true,
          controller: _controller,
          // selectionMode: DateRangePickerSelectionMode.extendableRange,
          selectionShape: DateRangePickerSelectionShape.circle,
          viewSpacing: 30,
          minDate: _minDate,
          maxDate: _maxDate,
          monthViewSettings: monthViewSetting(),

          headerStyle: headerStyle(),
          monthCellStyle: monthCellStyle(),
        ),
Positioned(
  top: 2,
  child: Text('Hello my Nigga!')
),
        MyFLoatButton()
      ],
    );
}


}