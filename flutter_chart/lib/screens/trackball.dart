import 'package:flutter/material.dart';
import 'package:flutter_chart/screens/type/stacked_bar_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TrackballChart extends StatefulWidget {
  const TrackballChart({ Key key }) : super(key: key);

  @override
  _TrackballChartState createState() => _TrackballChartState();
}

class _TrackballChartState extends State<TrackballChart> {
  TrackballBehavior _trackball;
  SfCartesianChart _chart;

  @override
  Widget build(BuildContext context) {
    intial();
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(child: this._chart)
          ]
        )
      )
    );
  }

  void intial() {
    this._trackball = TrackballBehavior(enable: true);
    this._chart = SfCartesianChart(
      trackballBehavior: this._trackball,
      backgroundColor: Colors.white10,
      title: ChartTitle(text: 'Tooltip'),
      primaryXAxis: CategoryAxis(),
      series: new StackedBarChart().series()
    );
  }
}