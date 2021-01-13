import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_core/core.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Data {
  double x;
  double y;
  Data({this.x, this.y});
}

class ZoomSelectorChart extends StatefulWidget {
  const ZoomSelectorChart({ Key key }) : super(key: key);

  @override
  _ZoomSelectorChartState createState() => _ZoomSelectorChartState();
}

class _ZoomSelectorChartState extends State<ZoomSelectorChart> {
  final double _min = 0.0;
  final double _max = 20.0;
  RangeController _rangeController;
  SfRangeValues _values = SfRangeValues(16.0, 20.0);
  SfRangeSelector selectorRange;
  SfCartesianChart mainChart;

  @override
  void initState() {
    super.initState();
    _rangeController = RangeController(start: _values.start, end: _values.end);
  }

  @override
  void dispose() {
    _rangeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    this.intialChart();
    

    return Column(
      children: [
        mainChart,
        SizedBox(height: 16),
        selectorRange,
      ],
    );
  }

  void intialChart() {
    final List<Data> chartData = <Data>[
      Data(x: 2.0, y: 2.2),
      Data(x: 3.0, y: 3.4),
      Data(x: 4.0, y: 2.8),
      Data(x: 5.0, y: 1.6),
      Data(x: 6.0, y: 2.3),
      Data(x: 7.0, y: 2.5),
      Data(x: 8.0, y: 2.9),
      Data(x: 9.0, y: 3.8),
      Data(x: 10.0, y: 3.7),
      Data(x: 11.0, y: 2.2),
      Data(x: 12.0, y: 3.4),
      Data(x: 13.0, y: 2.8),
      Data(x: 14.0, y: 1.6),
      Data(x: 15.0, y: 2.3),
      Data(x: 16.0, y: 2.5),
      Data(x: 17.0, y: 2.9),
      Data(x: 18.0, y: 3.8),
      Data(x: 19.0, y: 3.7),
    ];

    final series = <LineSeries<Data, double>>[
      LineSeries<Data, double>(
        color: Colors.red,
        dataSource: chartData,
        animationDuration: 0,
        xValueMapper: (Data sales, _) => sales.x,
        yValueMapper: (Data sales, _) => sales.y
      )
    ];

    final zoomingChart = SfCartesianChart(
      margin: const EdgeInsets.all(0),
      primaryXAxis: NumericAxis(
        minimum: _min,
        maximum: _max,
        isVisible: false
      ),
      primaryYAxis: NumericAxis(isVisible: false),
      plotAreaBorderWidth: 0,
      series: series,
    );

    mainChart = SfCartesianChart(
      backgroundColor: Colors.white10,
      title: ChartTitle(text: 'Zoom'),
      primaryXAxis: NumericAxis(
        minimum: _min,
        maximum: _max,
        isVisible: true,
        rangeController: _rangeController
      ),
      primaryYAxis: NumericAxis(isVisible: true),
      series: series
    );
    
    selectorRange = SfRangeSelector(
      min: _min,
      max: _max,
      interval: 3,
      controller: _rangeController,
      child: Container(
        height: 130,
        child: zoomingChart
      ),
    );
  }
}