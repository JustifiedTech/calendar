import 'dart:ui';
import 'import.dart';

  List<HijriDateTime>_specialDates = [

   ];


DateRangePickerHeaderStyle headerStyle() => DateRangePickerHeaderStyle(textStyle: TextStyle(color: kPrimaryLightColor, fontFamily: 'Muli', fontWeight:FontWeight.w500, fontSize:18, fontStyle: FontStyle.italic));

HijriDatePickerMonthCellStyle monthCellStyle() {
  return HijriDatePickerMonthCellStyle(
          textStyle: TextStyle(fontFamily: 'Muli'),
          // cellDecoration: BoxDecoration(),
            specialDatesDecoration: BoxDecoration(
              color: kAccentColor,
              border: Border.all(color:kAccentColor, width: 1),
                shape: BoxShape.circle),
            blackoutDateTextStyle: TextStyle(
              color: Colors.white, decoration: TextDecoration.lineThrough),
            specialDatesTextStyle: const TextStyle(color: Colors.white),
        );
}

HijriDatePickerMonthViewSettings monthViewSetting() {
  return HijriDatePickerMonthViewSettings(
        showWeekNumber: true,
        specialDates: <HijriDateTime>[
         ..._specialDates
        ],
        weekNumberStyle: DateRangePickerWeekNumberStyle(
                textStyle: TextStyle(fontStyle: FontStyle.italic, color: kSecondaryColor, fontFamily: 'Muli'),
                // backgroundColor: kSecondaryColor
                ),
                dayFormat: 'EEE',
                viewHeaderStyle: DateRangePickerViewHeaderStyle(textStyle: TextStyle(fontFamily: 'Muli', color: kPrimaryLightColor, fontWeight: FontWeight.bold, fontSize: 12, fontStyle: FontStyle.italic,))
                );
}