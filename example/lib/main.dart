import 'package:flutter/material.dart';
import 'package:widgetable_calendar/widgetable_calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widgetable Calendar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Widgetable Calendar Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
//    _calendarController = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
// <<<<<<< HEAD
//       body: Center(
//         child: WidgetableCalendar(
//           holidays: [],
//           backgroundColor: Colors.greenAccent,
//           height: MediaQuery.of(context).size.height * 0.5,
//           width: MediaQuery.of(context).size.width,
//         ),
// =======
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _buildCalendar(),
        ],
      ),
    );
  }

  Widget _buildCalendar() {
    return WidgetableCalendar(
      holidays: [],
      saturdayColor: Colors.green,
      weekDayColor: Colors.purple,
      backgroundColor: Colors.white.withOpacity(0),

//      calendarController: _calendarController,
//      initialSelectedDay: DateTime.now(),
    );
  }
}
