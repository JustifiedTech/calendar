
// import 'package:syncfusion_flutter_calendar/calendar.dart';

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


  //  final HijriDateTime anyDate = HijriDateTime.fromDateTime(DateTime(2021, 9, 15));

  //  final DateTime today = HijriDateTime.now().toDateTime();
// daysName.forEach((element) { });
final now = HijriDateTime.now();
int? monthIndex =HijriDateTime.now().month;
int? year =HijriDateTime.now().year;


_onChange(HijriDatePickerViewChangedArgs args) {
                 monthIndex =  args.visibleDateRange.startDate?.month;
                 year = args.visibleDateRange.startDate?.year;

}

// print(day.toString());

bool isToday(int day){

  if(((day +1) == now.weekday)){
  return true;
  }
  return false;
}


void setDay(){

setState(() {
  _controller.displayDate = now;
  monthIndex = now.month;

});
}

@override
void initState() {
    super.initState();
  }

@override
  Widget build(BuildContext context) {
    print(_controller.displayDate?.month);

final width = MediaQuery.of(context).size.width;
final height = MediaQuery.of(context).size.height;

    return SafeArea(

      child: Scaffold(

        drawer: MyDrawer(),
        // floatingActionButton: FloatingActionButton(child: Icon(Icons.add_task_outlined),
        // backgroundColor: kPrimaryColor,
        // foregroundColor: kPrimaryLightColor,
        // onPressed: ()=>{}, ),
        appBar: AppBar(centerTitle: false,
        title: Text(year.toString()),
        actions: [

          IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
            setState(() {
            _controller.backward!();
            });

          },),
          IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed: (){
            setState(() {
            _controller.forward!();

            });

          },),
          IconButton(icon: Icon(Icons.calendar_today_outlined), onPressed: setDay,),
          PopupMenuButton(icon: Icon(Icons.more_vert_sharp, size: 28,),
          color: kPrimaryDarkColor,
          itemBuilder: (context)=>
          popupMenuItem.map((item)=>PopupMenuItem<int>(child: Row(
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
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom:20, top: 10),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(monthsName[monthIndex!], style:TextStyle(fontSize: 18, fontStyle: FontStyle.italic, fontWeight:FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 50, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...daysName.asMap().entries.map((day) => Text(day.value, style: TextStyle(color: isToday(day.key)?kAccentColor:Colors.white),)).toList(),
                      ],
                    ),

                  ),
                  Container(
                    height: height*0.7,
                    child: SfHijriDateRangePicker(

                      todayHighlightColor: Theme.of(context).accentColor,
cellBuilder: cellBuilder,
monthFormat: 'EEE',

                      view: HijriDatePickerView.month,
                      showNavigationArrow: true,
                      toggleDaySelection: true,
                      headerHeight: 0,
                      controller: _controller,
                      selectionShape: DateRangePickerSelectionShape.circle,
                      minDate: _minDate,
                      maxDate: _maxDate,
                      monthViewSettings: monthViewSetting(),
navigationDirection: DateRangePickerNavigationDirection.vertical,
                      monthCellStyle: monthCellStyle(),
                      allowViewNavigation: false,
                       onViewChanged: _onChange,
                      // navigationMode:,
                    ),
                  ),
                ],
              ),
            ),
            MyFLoatButton()
          ],
        ),
      ),
    );
}

Widget cellBuilder(BuildContext context,
             HijriDateRangePickerCellDetails cellDetails) {
               final bool isToday = isSameDate(cellDetails.date, now);
               final bool isThisMonth = ((cellDetails.date.year == now.year) && (cellDetails.date.month == now.month) )?true:false;




           if (_controller.view == HijriDatePickerView.month) {

             return    Container(

                   width: cellDetails.bounds.width,
                   height: cellDetails.bounds.height,
                   alignment: Alignment.center,
                      child: Text(cellDetails.date.day.toString(),
                  style: TextStyle(fontFamily: 'Muli'),),
                  decoration: isToday? BoxDecoration(
                  // color: Theme.of(context).accentColor,
                   border: Border.all(color:Theme.of(context).accentColor, style:BorderStyle.solid, width: 3),
                    shape: BoxShape.circle

                    ):null,
             );
        } else if (_controller.view == HijriDatePickerView.year || _controller.view==HijriDatePickerView.month) {
             return Container(
             width: cellDetails.bounds.width,
               height: cellDetails.bounds.height,
             alignment: Alignment.center,

              decoration: isThisMonth? BoxDecoration(
              // color: Theme.of(context).accentColor,
               border: Border.all(color:Theme.of(context).accentColor, width: 4),
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