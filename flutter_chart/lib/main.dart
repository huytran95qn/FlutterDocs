import 'package:flutter/material.dart';
import 'package:flutter_chart/screens/crosshair/crosshair_chart.dart';
import 'package:flutter_chart/screens/eChart.dart';
import 'package:flutter_chart/screens/selection/select_data_point.dart';
import 'package:flutter_chart/screens/tooltip/tooltip_chart.dart';
import 'package:flutter_chart/screens/trackball/trackball.dart';

import 'screens/zoom/module.dart';
import 'widgets/tab/module.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: CustomTab(
        children: [
          CustomTabWidget(
            header: Text('Default', style: TextStyle(color: Colors.black)),
            body: EChart(),
            onPress: () => {}
          ),
          CustomTabWidget(
            header: Text('Zoom Behavior', style: TextStyle(color: Colors.black)),
            body: ZoomMain(),
            onPress: () => {}
          ),
          CustomTabWidget(
            header: Text('Tooltip Behavior', style: TextStyle(color: Colors.black)),
            body: TooltipChart(),
            onPress: () => {}
          ),
          CustomTabWidget(
            header: Text('Trackball Behavior', style: TextStyle(color: Colors.black)),
            body: TrackballChart(),
            onPress: () => {}
          ),
          CustomTabWidget(
            header: Text('Crosshair Behavior', style: TextStyle(color: Colors.black)),
            body: CrosshairChart(),
            onPress: () => {}
          ),
          CustomTabWidget(
            header: Text('Selection Behavior', style: TextStyle(color: Colors.black)),
            body: SelectDataPointChart(),
            onPress: () => {}
          )
        ],
      ),
    );
  }
}
