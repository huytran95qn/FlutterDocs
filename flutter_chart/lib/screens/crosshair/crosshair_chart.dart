import 'package:flutter/material.dart';
import 'package:flutter_chart/screens/type/module.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CrosshairChart extends StatefulWidget {
  const CrosshairChart({ Key key }) : super(key: key);

  @override
  _CrosshairChartState createState() => _CrosshairChartState();
}

class _CrosshairChartState extends State<CrosshairChart> {
  CrosshairBehavior _crosshair;
  SfCartesianChart _chart;

  @override
  Widget build(BuildContext context) {
    intial();
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(child: this._chart)
          ]
        )
      )
    );
  }

  void intial() {
    this._crosshair = CrosshairBehavior(enable: true);
    this._chart = SfCartesianChart(
      crosshairBehavior: this._crosshair,
      onCrosshairPositionChanging: (CrosshairRenderArgs args) => {},
      backgroundColor: Colors.white10,
      title: ChartTitle(text: 'Crosshair'),
      primaryXAxis: CategoryAxis(),
      series: new MultipleChart().series(),
    );
  }
}