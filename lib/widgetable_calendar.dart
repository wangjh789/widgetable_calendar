library widgetable_calendar;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// A Calculator.
class WidgetableCalendar extends StatefulWidget{
  final Color textColor;
  final Color backgroundColor;
  final Color lineColor;
  final List holidays;



  WidgetableCalendar(
      {this.textColor = Colors.black,
      this.backgroundColor = Colors.white,
      this.lineColor = Colors.black,
      this.holidays})
  :assert(holidays!=null);

  @override
  _WidgetableCalendarState createState() => _WidgetableCalendarState();
}

class _WidgetableCalendarState extends State<WidgetableCalendar> {
  int addOne(int value) {
    // print(widget.textColor);
    // print(widget.backgroundColor);
    // print(widget.lineColor);
    // print(widget.holidays);
    return value + 1;
  }

  int _counter = 0;


  void _incrementCounter() {
    setState(() {
      // 라이브러리 매소드 사용
      _counter = _counter+1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: widget.backgroundColor,
    );
  }
}
