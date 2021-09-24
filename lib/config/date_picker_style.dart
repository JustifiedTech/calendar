import 'dart:ui';
import 'import.dart';

  List<HijriDateTime>_specialDates = [
    // HijriDateTime.now().add(Duration(days: 3)),
    // HijriDateTime.now().subtract(Duration(days: 3))

   ];

   int firstDay =1;



HijriDatePickerMonthCellStyle monthCellStyle() {
  return HijriDatePickerMonthCellStyle(
          textStyle: TextStyle(fontFamily: 'Muli'),
          // cellDecoration: BoxDecoration(),
            specialDatesDecoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color:kAccentColor, width: 1),
                shape: BoxShape.circle),
            blackoutDateTextStyle: TextStyle(
              color: Colors.white, decoration: TextDecoration.lineThrough),
            specialDatesTextStyle: const TextStyle(color: Colors.black),
        );
}

HijriDatePickerMonthViewSettings monthViewSetting() {
  return HijriDatePickerMonthViewSettings(
        showWeekNumber: true,
        viewHeaderHeight: 0,
        firstDayOfWeek: 1,
       specialDates: <HijriDateTime>[
         ..._specialDates
        ],
        weekNumberStyle: DateRangePickerWeekNumberStyle(
                textStyle: TextStyle(fontStyle: FontStyle.italic, color: kSecondaryColor, fontFamily: 'Muli'),
                // backgroundColor: kSecondaryColor
                ),
                dayFormat: 'E',
                viewHeaderStyle: DateRangePickerViewHeaderStyle(textStyle: TextStyle(fontFamily: 'Muli', color: kSecondaryColor, fontWeight: FontWeight.bold, fontSize: 12, fontStyle: FontStyle.italic,))
                );

}