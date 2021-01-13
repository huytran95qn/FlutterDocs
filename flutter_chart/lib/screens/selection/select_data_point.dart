import 'package:flutter/material.dart';
import 'package:flutter_chart/screens/type/module.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SelectDataPointChart extends StatefulWidget {
  const SelectDataPointChart({ Key key }) : super(key: key);

  @override
  _SelectDataPointChartState createState() => _SelectDataPointChartState();
}

class _SelectDataPointChartState extends State<SelectDataPointChart> {
  SelectionBehavior _selection;
  SfCartesianChart _chart;
  int pointIndex;
  int seriesIndex;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    intial();
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(child: this._chart),
            Row(
              children: [
                FlatButton(
                  color: Colors.red,
                  child: Text('Select'),
                  onPressed: select
                ),
                FlatButton(
                  color: Colors.yellow,
                  child: Text('UnSelect'),
                  onPressed: isSelected == true ? unselect: null
                ),
              ],
            )
          ]
        )
      )
    );
  }

  void intial() {
    this._selection = SelectionBehavior(enable: true);
    this._chart = SfCartesianChart(
      backgroundColor: Colors.white10,
      title: ChartTitle(text: 'Selection'),
      primaryXAxis: CategoryAxis(),
      onPointTapped: (PointTapArgs args) => point(args),
      series: new StackedBarChart(selection: this._selection).series()
    );
  }

  void select() {
    this._selection.selectDataPoints(1, 2);
    setState(() {
      pointIndex = 1;
      seriesIndex = 2;
      isSelected = true;
    });
  }

  void unselect() {
    this._selection.selectDataPoints(pointIndex, seriesIndex);
    setState(() {
      isSelected = false;
    });
  }

  void point(PointTapArgs args) {
    final _pointIndex = args.dataPoints.length - args.pointIndex - 1;
    final _seriesIndex = args.seriesIndex;
    this._selection.selectDataPoints(_pointIndex, _seriesIndex);
    if(_pointIndex == this.pointIndex && _seriesIndex == this.seriesIndex) {
      isSelected = false;
    } else {
      isSelected = true;
    }

    setState(() {
      this.pointIndex = _pointIndex;
      this.seriesIndex = _seriesIndex;
      this.isSelected = this.isSelected;
    });
  }
}