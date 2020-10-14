library widgetable_calendar;

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:core';

part 'src/calendar.dart';

part 'src/calendar_controller.dart';

/// A Calculator.
class WidgetableCalendar1 extends StatefulWidget {
  final Color weekDayColor;
  final Color sundayColor;
  final Color saturdayColor;
  final Color backgroundColor;
  final Color lineColor;
  final List holidays;
  final double height;
  final double width;

  WidgetableCalendar1(
      {this.weekDayColor = Colors.black,
      this.sundayColor = Colors.red,
      this.saturdayColor = Colors.blue,
      this.backgroundColor = Colors.white,
      this.lineColor = Colors.black,
      this.height,
      this.width,
      this.holidays})
      : assert(holidays != null);

  @override
  _WidgetableCalendarState createState() => _WidgetableCalendarState();
}

class _WidgetableCalendarState1 extends State<WidgetableCalendar1> {
  List weekDays = ['일', '월', '화', '수', '목', '금', '토'];
  List date = [];

  @override
  void initState() {
    setDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: widget.lineColor,
      child: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                childAspectRatio: (widget.width / 7) / (widget.height / 6)),
            itemCount: 7,
            itemBuilder: (context, index) {
              return Container(
                color: widget.backgroundColor,
                margin: EdgeInsets.all(1),
                child: Center(
                  child: Text(
                    weekDays[index],
                    style: TextStyle(
                        color: weekDays[index] == '일' || weekDays[index] == '토'
                            ? Colors.red
                            : Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                childAspectRatio: (widget.width / 7) / (widget.height / 6)),
            itemCount: 35,
            itemBuilder: (context, index) {
              return Container(
                color: widget.backgroundColor,
                margin: EdgeInsets.all(1),
              );
            },
          ),
        ],
      ),
    );
  }

  void setDate() {
    DateTime now = DateTime.now();
    DateTime thisMonth = DateTime.utc(now.year, now.month);
    // for(int i =0;i<)
    print(DateTime.utc(now.year, now.month));
  }
}
// =======

//class WidgetableCalendar extends StatefulWidget{
//  final Color textColor;
//  final Color backgroundColor;
//  final Color lineColor;
//  final List holidays;
//
//
//
//  WidgetableCalendar(
//      {this.textColor = Colors.black,
//      this.backgroundColor = Colors.white,
//      this.lineColor = Colors.black,
//      this.holidays})
//  :assert(holidays!=null);
//
//  @override
//  _WidgetableCalendarState createState() => _WidgetableCalendarState();
//}
//
//class _WidgetableCalendarState extends State<WidgetableCalendar> {
//  int addOne(int value) {
//    // print(widget.textColor);
//    // print(widget.backgroundColor);
//    // print(widget.lineColor);
//    // print(widget.holidays);
//    return value + 1;
//  }
//
//  int _counter = 0;
//
//
//  void _incrementCounter() {
//    setState(() {
//      // 라이브러리 매소드 사용
//      _counter = _counter+1;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      width: 100,
//      height: 100,
//      color: widget.backgroundColor,
//    );
//  }
//}
// >>>>>>> d0654ed8d355b32ea895f1b116b8fe3152aea244
