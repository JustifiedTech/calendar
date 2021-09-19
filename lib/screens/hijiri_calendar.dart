
import '../config/import.dart';

class HijiriCalendar extends StatefulWidget {
  HijiriCalendar({Key? key}) : super(key: key);

  @override
  _HijiriCalendarState createState() => _HijiriCalendarState();
}

class _HijiriCalendarState extends State<HijiriCalendar> {

   HijriDatePickerController _controller = HijriDatePickerController();



HijriDateTime _minDate = HijriDateTime.fromDateTime(DateTime(2021, 01, 01));
HijriDateTime _maxDate = HijriDateTime.fromDateTime(DateTime(2036, 12, 31));

List<String> daysName = ['nil','FE', 'DI', 'ZO', 'WO', 'BYEN', 'TSIBI', 'WE'];
List<String> monthsName = ['nil','Jonwoju', 'Jenza', 'Natswi', 'Zawi', 'Chukone', 'Di', 'Sonfa', 'Ane', 'Gben-Yo', 'Aye', 'Weku', 'Kenuju'];

  //  final HijriDateTime anyDate = HijriDateTime.fromDateTime(DateTime(2021, 9, 15));

  //  final DateTime today = HijriDateTime.now().toDateTime();

 final isToday = DateTime.now();
  ///                                                           DateTime.now))
void controllerF(){


  // _controller.addPropertyChangedListener(() { })
  // _controller.displayDate = HijriDateTime(2022, 02, 09);
}

@override
void initState() {
//  _controller.view = HijriDatePickerView.month;
// controllerF();
    super.initState();
  }

@override
  Widget build(BuildContext context) {

// final width = MediaQuery.of(context).size.width;
// final height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom:50),
          child: SfHijriDateRangePicker(
            todayHighlightColor: kAccentColor,
cellBuilder: cellBuilder,
monthFormat: 'EEE',

            // view: HijriDatePickerView,
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
        ),
        MyFLoatButton()
      ],
    );
}

Widget cellBuilder(BuildContext context,
             HijriDateRangePickerCellDetails cellDetails) {
               final bool isToday = isSameDate(cellDetails.date, HijriDateTime.now());
               final bool isThisMonth = ((cellDetails.date.year == HijriDateTime.now().year) && (cellDetails.date.month == HijriDateTime.now().month) )?true:false;




           if (_controller.view == HijriDatePickerView.month) {

             return Container(

               width: cellDetails.bounds.width,
               height: cellDetails.bounds.height,
               alignment: Alignment.center,
                  child: Text(cellDetails.date.day.toString(),
              style: TextStyle(fontFamily: 'Muli'),),
              decoration: isToday? BoxDecoration(
              // color: kAccentColor,
               border: Border.all(color:kAccentColor, style:BorderStyle.solid, width: 3),
                shape: BoxShape.circle

                ):null,


             );
        } else if (_controller.view == HijriDatePickerView.year || _controller.view==HijriDatePickerView.month) {
             return Container(
             width: cellDetails.bounds.width,
               height: cellDetails.bounds.height,
             alignment: Alignment.center,

              decoration: isThisMonth? BoxDecoration(
              // color: kAccentColor,
               border: Border.all(color:kAccentColor, width: 4),
            borderRadius: BorderRadius.circular(100),
              shape: BoxShape.rectangle,
             ):null,

             child: Text(monthsName[cellDetails.date.month]),
           );
         } else if (_controller.view == HijriDatePickerView.decade || _controller.view == HijriDatePickerView.year || _controller.view==HijriDatePickerView.month) {
           return Container(
             width: cellDetails.bounds.width,
             height: 300,
            alignment: Alignment.center,
             child: Text(cellDetails.date.year.toString()),
           );
         } else {
           final int yearValue = (cellDetails.date.year ~/ 10) * 10;
           return Container(
               color: Colors.grey,

             width: cellDetails.bounds.width,
             height: 300,
             alignment: Alignment.center,
             child: Text(
                yearValue.toString() + ' to ' + (yearValue + 9).toString()),
           );
         }
       }


}