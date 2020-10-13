import 'package:flutter/material.dart';
import 'package:widgetable_calendar/widgetable_calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
  // 라이브러리 클래스 호출
  Calculator test = Calculator();

  @override
  void initState() {
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      // 라이브러리 매소드 사용
      _counter = test.addOne(_counter);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _buildCalendar(),
        ],
      ),
    );
  }

  Widget _buildCalendar() {
    return WidgetableCalendar();
  }
}
