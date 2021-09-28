// import 'package:syncfusion_flutter_calendar/calendar.dart';


import 'package:shared_preferences/shared_preferences.dart';

import '../config/import.dart';

class HijiriCalendar extends StatefulWidget {
  HijiriCalendar({Key? key}) : super(key: key);

  @override
  _HijiriCalendarState createState() => _HijiriCalendarState();
}

class _HijiriCalendarState extends State<HijiriCalendar> {
  List<String> daysName = ['FE', 'DI', 'ZO  ', 'WO  ', 'BY', 'TS', 'WE'];
  List<String> dayName = ['WE', 'FE', 'DI', 'ZO  ', 'WO  ', 'BY', 'TS'];
  List<HijriDateTime> _specialDates = [
    // HijriDateTime.now().add(Duration(days: 3)),
    // HijriDateTime.now().subtract(Duration(days: 3))
  ];

  HijriDatePickerController _controller = HijriDatePickerController();

  HijriDateTime _minDate = HijriDateTime.fromDateTime(DateTime(2021, 01, 01));
  HijriDateTime _maxDate = HijriDateTime.fromDateTime(DateTime(2036, 12, 31));

  //  final HijriDateTime anyDate = HijriDateTime.fromDateTime(DateTime(2021, 9, 15));

  //  final DateTime today = HijriDateTime.now().toDateTime();
  final now = HijriDateTime.now();
  int? monthIndex = HijriDateTime.now().month;
  int? year = HijriDateTime.now().year;

  _onChange(HijriDatePickerViewChangedArgs args) {
    monthIndex = args.visibleDateRange.startDate?.month;
    year = args.visibleDateRange.startDate?.year;
  }

// print(day.toString());

  bool isToday(int day) {
    if (((day + 1) == now.weekday)) {
      return true;
    }
    return false;
  }

  bool isToday2(int day) {
    if (((day + 6) == now.weekday)) {
      return true;
    }
    return false;
  }

  void setDay() {
    setState(() {
      _controller.displayDate = now;
      monthIndex = now.month;
    });
  }

  Future callTheme() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final provider = Provider.of<ThemeProvider>(context, listen: false);

    String theme = _prefs.getString('theme') ?? 'System';
    String firstDay = _prefs.getString('firstDay') ?? 'Monday';
    bool showWeek = _prefs.getBool('showWeek') ?? true;
    provider.changeTheme(theme);
    provider.firstDayToggle(firstDay);
    provider.showWeek(showWeek);
  }

  @override
  void initState() {
    super.initState();
    callTheme();
  }

  @override
  void dispose() {
    super.dispose();
    // callTheme();

  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
        // floatingActionButton: FloatingActionButton(child: Icon(Icons.add_task_outlined),
        // backgroundColor: kPrimaryColor,
        // foregroundColor: kPrimaryLightColor,
        // onPressed: ()=>{}, ),
        appBar: AppBar(
          centerTitle: false,
          title: Text(year.toString()),
          actions: [
            IconButton(
              padding: EdgeInsets.only(right: 10),
              icon: Icon(Icons.calendar_today_outlined),
              onPressed: setDay,
            ),
           
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            setState(() {
                              _controller.backward!();
                            });
                          }),
                      Text(monthsName[monthIndex!],
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          setState(() {
                            _controller.forward!();
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width,
                  padding: themeProvider.showWeekNumber
                      ? EdgeInsets.only(left: 50, right: 10)
                      : EdgeInsets.only(left: 20, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: themeProvider.firstDay == 1
                        ? daysName
                            .asMap()
                            .entries
                            .map((day) => Text(
                                  day.value,
                                  style: TextStyle(
                                      color: isToday(day.key)
                                          ? Theme.of(context).accentColor
                                          : Theme.of(context).iconTheme.color),
                                ))
                            .toList()
                        : dayName
                            .asMap()
                            .entries
                            .map((day) => Text(
                                  day.value,
                                  style: TextStyle(
                                      color: isToday2(day.key - 6)
                                          ? Theme.of(context).accentColor
                                          : Theme.of(context).iconTheme.color),
                                ))
                            .toList(),
                  ),
                ),
                Container(
                  height: height * 0.7,
                  child: SfHijriDateRangePicker(
                    selectionColor: Colors.transparent,
                    selectionTextStyle: TextStyle(color: Colors.transparent),
                    todayHighlightColor: Theme.of(context).accentColor,
                    rangeSelectionColor: Colors.transparent,
                    cellBuilder: cellBuilder,
                    monthFormat: 'EEE',
                    view: HijriDatePickerView.month,
                    toggleDaySelection: true,

                    headerHeight: 0,
                    controller: _controller,
                    selectionMode: DateRangePickerSelectionMode.range,
                    selectionShape: DateRangePickerSelectionShape.circle,
                    minDate: _minDate,
                    maxDate: _maxDate,
                    monthViewSettings: HijriDatePickerMonthViewSettings(
                        showWeekNumber: themeProvider.showWeekNumber,
                        viewHeaderHeight: 0,
                        firstDayOfWeek: themeProvider.firstDay,
                        specialDates: <HijriDateTime>[..._specialDates],
                        weekNumberStyle: DateRangePickerWeekNumberStyle(
                          textStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: kSecondaryColor,
                              fontFamily: 'Muli'),
                          // backgroundColor: kSecondaryColor
                        ),
                        dayFormat: 'EEE',
                        viewHeaderStyle: DateRangePickerViewHeaderStyle(
                            textStyle: TextStyle(
                          fontFamily: 'Muli',
                          color: kSecondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                        ))),

                    monthCellStyle: monthCellStyle(),
                    onViewChanged: _onChange,
                    // navigationMode:,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cellBuilder(
      BuildContext context, HijriDateRangePickerCellDetails cellDetails) {
    final bool isToday = isSameDate(cellDetails.date, now);
    final bool isThisMonth = ((cellDetails.date.year == now.year) &&
            (cellDetails.date.month == now.month))
        ? true
        : false;

    if (_controller.view == HijriDatePickerView.month) {
      return Container(
        width: cellDetails.bounds.width,
        height: cellDetails.bounds.height,
        alignment: Alignment.center,
        child: Text(
          cellDetails.date.day.toString(),
          style: TextStyle(fontFamily: 'Muli'),
        ),
        decoration: isToday
            ? BoxDecoration(
                // color: Theme.of(context).accentColor,
                border: Border.all(
                    color: Theme.of(context).accentColor,
                    style: BorderStyle.solid,
                    width: 3),
                shape: BoxShape.circle)
            : null,
      );
    } else if (_controller.view == HijriDatePickerView.year ||
        _controller.view == HijriDatePickerView.month) {
      return Container(
        width: cellDetails.bounds.width,
        height: cellDetails.bounds.height,
        alignment: Alignment.center,
        decoration: isThisMonth
            ? BoxDecoration(
                // color: Theme.of(context).accentColor,
                border:
                    Border.all(color: Theme.of(context).accentColor, width: 4),
                borderRadius: BorderRadius.circular(100),
                shape: BoxShape.rectangle,
              )
            : null,
        child: Text(monthsName[cellDetails.date.month]),
      );
    } else if (_controller.view == HijriDatePickerView.decade ||
        _controller.view == HijriDatePickerView.year ||
        _controller.view == HijriDatePickerView.month) {
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
        child: Text(yearValue.toString() + ' to ' + (yearValue + 9).toString()),
      );
    }
  }

  HijriDatePickerMonthCellStyle monthCellStyle() {
    return HijriDatePickerMonthCellStyle(
      textStyle: TextStyle(fontFamily: 'Muli'),
      // cellDecoration: BoxDecoration(),
      specialDatesDecoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: kAccentColor, width: 1),
          shape: BoxShape.circle),
      blackoutDateTextStyle: TextStyle(
          color: Colors.white, decoration: TextDecoration.lineThrough),
      specialDatesTextStyle: const TextStyle(color: Colors.black),
    );
  }
}
