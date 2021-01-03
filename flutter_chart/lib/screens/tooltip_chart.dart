import 'package:flutter/material.dart';
import 'package:flutter_chart/screens/type/stacked_bar_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'mock_data.dart';

class TooltipChart extends StatefulWidget {
  const TooltipChart({ Key key }) : super(key: key);

  @override
  _TooltipChartState createState() => _TooltipChartState();
}

class _TooltipChartState extends State<TooltipChart> {
  TooltipBehavior _tooltip;
  SfCartesianChart _chart;

  @override
  Widget build(BuildContext context) {
    intial();
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(child: this._chart),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FlatButton(
                  child: Text('Show'),
                  onPressed: show
                ),
                FlatButton(
                  child: Text('Show By Index'),
                  onPressed: showByIndex
                ),
                FlatButton(
                  child: Text('Show By Pixel'),
                  onPressed: showByPixel
                ),
                FlatButton(
                  child: Text('Hide'),
                  onPressed: hide
                )
              ],
            )
          ]
        )
      )
    );
  }

  void intial() {
    this._tooltip = TooltipBehavior(
      enable: true,
      opacity: 0.5,
      // builder: (dynamic data, dynamic point, dynamic series, int pointIndex, int seriesIndex) {
      //   final _data = data as PopularColorData;
      //   return customizeToolTip(_data.data[seriesIndex]);
      // }
    );
    this._chart = SfCartesianChart(
      tooltipBehavior: this._tooltip,
      backgroundColor: Colors.white10,
      title: ChartTitle(text: 'Tooltip'),
      primaryXAxis: CategoryAxis(),
      onTooltipRender: (TooltipArgs args) => {
        print(args.locationX),
        print(args.locationY)
      },
      series: new StackedBarChart().series()
    );
  }

  void show() {
    this._tooltip.show(4,1);
  }

  void showByIndex() {
    this._tooltip.showByIndex(0,1);
  }

  void showByPixel() {
    this._tooltip.showByPixel(761.016923076923, 148.6);
  }

  void hide() {
    this._tooltip.hide();
  }

  Widget customizeToolTip(ColorData data) {
    return Container(
      color: Colors.grey,
      width: 100,
      height: 50,
      child: Column(
        children: [
          Text(data.name),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 12,
                height: 12,
                margin: EdgeInsets.only(right: 4),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(50)
                ),
              ),
              Text('${data.percentage}')
            ],
          )
        ],
      ),
    );
  }
}