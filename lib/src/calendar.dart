part of widgetable_calendar;

typedef void OnCalendarCreated(DateTime first, DateTime last);

class WidgetableCalendar extends StatefulWidget {
//  final CalendarController calendarController;
//  final DateTime initialSelectedDay;

  WidgetableCalendar({
    Key key,
//    @required this.calendarController,
//    this.initialSelectedDay,
  });

  _WidgetableCalendarState createState() => _WidgetableCalendarState();
}

class _WidgetableCalendarState extends State<WidgetableCalendar>
    with SingleTickerProviderStateMixin {
  DateTime selectDate = DateTime.now();
  DateTime firstDay;
  DateTime lastDay;
  List weekList = [];
  bool todayOrNot;

  @override
  void initState() {
    super.initState();
    firstDay = DateTime(selectDate.year, selectDate.month, 1);
    lastDay = DateTime(selectDate.year, selectDate.month + 1, 1)
        .subtract(new Duration(days: 1));
    weekList = _makeWeekList(firstDay, lastDay);
  }

  List _makeWeekList(DateTime firstDay, DateTime lastDay) {
    List<int> dateList = List<int>();

    int firstDayWeekday = firstDay.weekday == 7 ? 0 : firstDay.weekday;
    int lastDayWeekday = lastDay.weekday == 7 ? 0 : lastDay.weekday;

    // make long date list ( ex. [0,0,0,0,1,2,3,...,31]
    for (int i = 0; firstDayWeekday != i; i++) dateList.add(0);
    for (int i = 0; lastDay.day != i; i++) dateList.add(i + 1);
    for (int i = lastDayWeekday; i != 6; i++) dateList.add(0);

    // split with 7 ( make it to week! )  ( ex. [ [0,0,0,0,1,2,3], [4,5,...], ... ] )
    List weekList = [];
    for (var i = 0; i < dateList.length; i += 7) {
      weekList.add(dateList.sublist(
          i, i + 7 > dateList.length ? dateList.length : i + 7));
    }

    return weekList;
  }

  bool _isToday(int date) {
    DateTime today = DateTime.now();
    if (selectDate.year == today.year &&
        selectDate.month == today.month &&
        date == today.day) {
      return true;
    } else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildHeader(),
          _buildCalendarContent(),
          _buildTodayButton(),
        ],
      ),
    );
  }

  // This is Header (  <   2020 october   >  )
  Widget _buildHeader() {
    List monthList = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];

    final children = [
      IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          setState(() {
            selectDate = DateTime(selectDate.year, selectDate.month - 1, 1);
            firstDay = DateTime(selectDate.year, selectDate.month, 1);
            lastDay = DateTime(selectDate.year, selectDate.month + 1, 1)
                .subtract(new Duration(days: 1));
            weekList = _makeWeekList(firstDay, lastDay);
          });
        },
      ),
      Expanded(
        child: Container(
          child: Center(
              child: Text(selectDate.year.toString() +
                  " " +
                  monthList[selectDate.month - 1])),
        ),
      ),
      IconButton(
        icon: Icon(Icons.arrow_forward_ios),
        onPressed: () {
          setState(() {
            selectDate = DateTime(selectDate.year, selectDate.month + 1, 1);
            firstDay = DateTime(selectDate.year, selectDate.month, 1);
            lastDay = DateTime(selectDate.year, selectDate.month + 1, 1)
                .subtract(new Duration(days: 1));
            weekList = _makeWeekList(firstDay, lastDay);
          });
        },
      ),
    ];

    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: children,
      ),
    );
  }

  Widget _buildCalendarContent() {
    final children = <TableRow>[_buildDaysOfWeek()];

    for (int i = 0; i < weekList.length; i++) {
      children.add(_buildEachWeek(weekList[i]));
    }

    return Table(
      children: children,
    );
  }

  // SUN MON TUE WED THU FRI SAT
  TableRow _buildDaysOfWeek() {
    List dayList = [
      "SUN",
      "MON",
      "TUE",
      "WED",
      "THU",
      "FRI",
      "SAT",
    ];
    final children = <TableCell>[];

    for (int i = 0; i < dayList.length; i++) {
      children.add(TableCell(
          child: Container(
        width: double.infinity,
        height: 50,
        child: Center(
            child: i == 0
                ? Text(
                    dayList[i],
                    style: TextStyle(color: Colors.red),
                  )
                : i == 6
                    ? Text(
                        dayList[i],
                        style: TextStyle(color: Colors.blue),
                      )
                    : Text(dayList[i])),
      )));
    }

    return TableRow(children: children);
  }

  TableRow _buildEachWeek(List weekList) {
    final children = <TableCell>[];

    for (int i = 0; i < weekList.length; i++) {
      String date = weekList[i] != 0 ? weekList[i].toString() : "";
      children.add(
        _isToday(weekList[i])
            ? TableCell(
                child: Container(
                width: double.infinity,
                height: 50,
                color: Colors.grey[300],
                child: Center(
                  child:
                    i == 0
                        ? Text(
                      date,
                      style: TextStyle(color: Colors.red),
                    )
                        : i == 6
                        ? Text(
                      date,
                      style: TextStyle(color: Colors.blue),
                    )
                        : Text(date)),

//                    child: Text(date)),
              ))
            : TableCell(
                child: Container(
                width: double.infinity,
                height: 50,
                child: Center(
//                    child: Text(date)
                    child:
                    i == 0
                        ? Text(
                      date,
                      style: TextStyle(color: Colors.red),
                    )
                        : i == 6
                        ? Text(
                      date,
                      style: TextStyle(color: Colors.blue),
                    )
                        : Text(date)),
                ),
              ),
      );
    }

    return TableRow(children: children);
  }

  Widget _buildTodayButton() {
    final children = [
      Expanded(
        child: FlatButton(
          child: Text("Today"),
          onPressed: () {
            setState(() {
              selectDate = DateTime.now();
              firstDay = DateTime(selectDate.year, selectDate.month, 1);
              lastDay = DateTime(selectDate.year, selectDate.month + 1, 1)
                  .subtract(new Duration(days: 1));
              weekList = _makeWeekList(firstDay, lastDay);
            });
          },
        ),
      ),
    ];

    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: children,
      ),
    );
  }
}
