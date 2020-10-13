library widgetable_calendar;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// A Calculator.
class WidgetableCalendar extends StatefulWidget {
  final Color textColor;
  final Color backgroundColor;
  final Color lineColor;
  final List holidays;
  final double height;
  final double width;

  WidgetableCalendar(
      {this.textColor = Colors.black,
      this.backgroundColor = Colors.white,
      this.lineColor = Colors.black,
      this.height,
      this.width,
      this.holidays})
      : assert(holidays != null),
        assert(height != null && width != null);

  @override
  _WidgetableCalendarState createState() => _WidgetableCalendarState();
}

class _WidgetableCalendarState extends State<WidgetableCalendar> {
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
                            : Colors.black,fontWeight: FontWeight.bold),
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

  void setDate(){
    DateTime now = DateTime.now();
    DateTime thisMonth = DateTime.utc(now.year,now.month);
    // for(int i =0;i<)
    print(DateTime.utc(now.year,now.month));
  }
}
