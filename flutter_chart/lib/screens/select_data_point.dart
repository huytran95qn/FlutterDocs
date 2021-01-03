import 'package:flutter/material.dart';
import 'package:flutter_chart/screens/type/stacked_bar_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SelectDataPointChart extends StatefulWidget {
  const SelectDataPointChart({ Key key }) : super(key: key);

  @override
  _SelectDataPointChartState createState() => _SelectDataPointChartState();
}

class _SelectDataPointChartState extends State<SelectDataPointChart> {
  SelectionBehavior _selection;
  SfCartesianChart _chart;

  @override
  Widget build(BuildContext context) {
    intial();
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(child: this._chart),
            FlatButton(
              child: Text('Select'),
              onPressed: select
            ),
          ]
        )
      )
    );
  }

  void intial() {
    this._selection = SelectionBehavior(enable: true);
    this._chart = SfCartesianChart(
      backgroundColor: Colors.white10,
      title: ChartTitle(text: 'Tooltip'),
      primaryXAxis: CategoryAxis(),
      series: new StackedBarChart(selection: this._selection).series()
    );
  }

  void select() {
    this._selection.selectDataPoints(1, 2);
  }
}