part of widgetable_calendar;


class WidgetableCalendar extends StatefulWidget {
  final bool headerVisible;

  WidgetableCalendar({
    Key key,
    this.headerVisible = true,
  });

  _WidgetableCalendarState createState() => _WidgetableCalendarState();
}


class _WidgetableCalendarState extends State<WidgetableCalendar> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (widget.headerVisible) _buildHeader(),
          _buildCalendarContent(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    final children = [
      IconButton(
        icon: Icon(Icons.arrow_back_ios),
      ),
      Expanded(
        child: Container(
          child: Center(child: Text("Month")),
        ),
      ),
      IconButton(
        icon: Icon(Icons.arrow_forward_ios),
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
    return Table(
      border: TableBorder.all(),
      children: <TableRow>[
        TableRow(children: <Widget>[
          TableCell(child: Container(width: double.infinity, height: 100, color: Colors.red)),
          TableCell(child: Container(width: double.infinity, height: 100, color: Colors.green)),
          TableCell(child: Container(width: double.infinity, height: 100, color: Colors.red)),
          TableCell(child: Container(width: double.infinity, height: 100, color: Colors.green)),
          TableCell(child: Container(width: double.infinity, height: 100, color: Colors.red)),
          TableCell(child: Container(width: double.infinity, height: 100, color: Colors.green)),
          TableCell(child: Container(width: double.infinity, height: 100, color: Colors.red)),
        ]),
        TableRow(children: <Widget>[
          TableCell(child: Container(width: double.infinity, height: 100, color: Colors.green)),
          TableCell(child: Container(width: double.infinity, height: 100, color: Colors.red)),
          TableCell(child: Container(width: double.infinity, height: 100, color: Colors.green)),
          TableCell(child: Container(width: double.infinity, height: 100, color: Colors.red)),
          TableCell(child: Container(width: double.infinity, height: 100, color: Colors.green)),
          TableCell(child: Container(width: double.infinity, height: 100, color: Colors.red)),
          TableCell(child: Container(width: double.infinity, height: 100, color: Colors.green)),
        ]),
        TableRow(children: <Widget>[
          TableCell(child: Container(width: double.infinity, height: 100, color: Colors.red)),
          TableCell(child: Container(width: double.infinity, height: 100, color: Colors.green)),
          TableCell(child: Container(width: double.infinity, height: 100, color: Colors.red)),
          TableCell(child: Container(width: double.infinity, height: 100, color: Colors.green)),
          TableCell(child: Container(width: double.infinity, height: 100, color: Colors.red)),
          TableCell(child: Container(width: double.infinity, height: 100, color: Colors.green)),
          TableCell(child: Container(width: double.infinity, height: 100, color: Colors.red)),
        ]),
        TableRow(children: <Widget>[
          TableCell(child: Container(width: double.infinity, height: 100, color: Colors.green)),
          TableCell(child: Container(width: double.infinity, height: 100, color: Colors.red)),
          TableCell(child: Container(width: double.infinity, height: 100, color: Colors.green)),
          TableCell(child: Container(width: double.infinity, height: 100, color: Colors.red)),
          TableCell(child: Container(width: double.infinity, height: 100, color: Colors.green)),
          TableCell(child: Container(width: double.infinity, height: 100, color: Colors.red)),
          TableCell(child: Container(width: double.infinity, height: 100, color: Colors.green)),
        ]),
      ],
    );
  }

}