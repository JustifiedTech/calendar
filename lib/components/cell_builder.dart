import '../config/import.dart';

class CellBuilder {
HijriDatePickerController _controller = HijriDatePickerController();

Widget cellBuilder(BuildContext context,
             HijriDateRangePickerCellDetails cellDetails) {
           if (_controller.view == HijriDatePickerView.month) {
             return Container(
               width: cellDetails.bounds.width,
               height: cellDetails.bounds.height,
               alignment: Alignment.center,
               child: Column(
                 children: [
                   Text(cellDetails.date.day.toString()),
                   Text(cellDetails.date.weekday.toString())
                 ],
               ),
             );
        } else if (_controller.view == HijriDatePickerView.year) {
             return Container(
             width: cellDetails.bounds.width,
             height: cellDetails.bounds.height,
             alignment: Alignment.center,
             child: Text(cellDetails.date.month.toString()),
           );
         } else if (_controller.view == HijriDatePickerView.decade) {
           return Container(
             width: cellDetails.bounds.width,
             height: cellDetails.bounds.height,
            alignment: Alignment.center,
             child: Text(cellDetails.date.year.toString()),
           );
         } else {
           final int yearValue = (cellDetails.date.year ~/ 10) * 10;
           return Container(
             width: cellDetails.bounds.width,
             height: cellDetails.bounds.height,
             alignment: Alignment.center,
             child: Text(
                yearValue.toString() + ' - ' + (yearValue + 9).toString()),
           );
         }
       }
}
