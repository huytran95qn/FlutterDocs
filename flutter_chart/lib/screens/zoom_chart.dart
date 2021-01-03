import 'package:flutter/material.dart';
import 'package:flutter_chart/screens/type/stacked_bar_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ZoomChart extends StatefulWidget {
  const ZoomChart({ Key key }) : super(key: key);

  @override
  _ZoomChartState createState() => _ZoomChartState();
}

class _ZoomChartState extends State<ZoomChart> {
  ZoomPanBehavior zooming;

  @override
  Widget build(BuildContext context) {
    zooming = ZoomPanBehavior(
      enableSelectionZooming: true,
      enableDoubleTapZooming: true,
      enablePinching: true,
      enablePanning: true,
    );
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          child: SfCartesianChart(
            backgroundColor: Colors.white10,
            title: ChartTitle(text: 'Zoom'),
            primaryXAxis: CategoryAxis(),
            zoomPanBehavior: zooming,
            onZooming: (ZoomPanArgs args){
              print('---------------------------------------------');
              print('onZooming');
              print('currentZoomFactor ${args.currentZoomFactor}');
              print('currentZoomPosition ${args.currentZoomPosition}');
              print('----------------------------------------------');
            },
            onZoomStart: (ZoomPanArgs args){
              print('---------------------------------------------');
              print('onZoomStart');
              print('currentZoomFactor ${args.currentZoomFactor}');
              print('currentZoomPosition ${args.currentZoomPosition}');
              print('----------------------------------------------');
            },
            onZoomEnd: (ZoomPanArgs args){
              print('---------------------------------------------');
              print('onZoomEnd');
              print('currentZoomFactor ${args.currentZoomFactor}');
              print('currentZoomPosition ${args.currentZoomPosition}');
              print('----------------------------------------------');
            },
            onZoomReset: (ZoomPanArgs args){
              print('---------------------------------------------');
              print('onZoomReset');
              print('currentZoomFactor ${args.currentZoomFactor}');
              print('currentZoomPosition ${args.currentZoomPosition}');
              print('----------------------------------------------');
            },
            series: new StackedBarChart().series()
          ),
        ),
        Row(
          children: [
            FlatButton(
              color: Colors.green,
              child: Text('Zoom In'),
              onPressed: zoomIn
            ),
            FlatButton(
              color: Colors.yellow,
              child: Text('Zoom Out'),
              onPressed: zoomOut
            ),
            FlatButton(
              color: Colors.red,
              child: Text('Zoom By Factor'),
              onPressed: zoomByFactor
            ),
            FlatButton(
              color: Colors.blue,
              child: Text('Zoom Reset'),
              onPressed: zoomReset
            )
          ],
        )
      ],
    );
  }

  void zoomIn() {
    zooming.zoomIn();
  }

  void zoomOut() {
    zooming.zoomOut();
  }

  void zoomByFactor() {
    zooming.zoomByFactor(0.5);
  }

  void zoomReset() {
    zooming.reset();
  }
}