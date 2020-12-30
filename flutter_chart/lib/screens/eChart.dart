import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math';

class EChart extends StatefulWidget {
  const EChart({ Key key }) : super(key: key);

  @override
  _EChartState createState() => _EChartState();
}

class _EChartState extends State<EChart> {
  List<SalesData> dataSource;
  @override
  Widget build(BuildContext context) {
    dataSource = new SalesData().mockDate();
    return Container(
      padding: EdgeInsets.all(16),
      child: SfCartesianChart(
        backgroundColor: Colors.white10,
        
        //
        borderColor: Colors.blue,
        borderWidth: 1,

        plotAreaBackgroundColor: Colors.grey.withOpacity(0.5),
        plotAreaBorderColor: Colors.blue,
        plotAreaBorderWidth: 5,
        // plotAreaBackgroundImage: Image.asset(name)

        // tooltip
        tooltipBehavior: TooltipBehavior(
          enable: true,
          builder: (dynamic data, dynamic point, dynamic series, int pointIndex, int seriesIndex) {
            final value = data as SalesData;
            return Container(
              child: Text(
                'PointIndex : ${value.data[seriesIndex]}'
              )
            );
          }
        ),
        onTooltipRender: (TooltipArgs args) => {},

        // onActualRangeChanged: (ActualRangeChangedArgs args) => print('onActualRangeChanged ${args.visibleMin}'),
        // onAxisLabelRender: (AxisLabelRenderArgs args) => args.text = 'axis Label',
        // onDataLabelRender: (DataLabelRenderArgs args) {
        //   args.text = 'Data label';
        //   CartesianSeries<dynamic, dynamic> series = args.seriesRenderer;
        //   //Changed the background color of the data label based on the series type
        //   if (series.name == null) {
        //     args.color = Colors.yellow;
        //   } else if(series.name == 'Pink'){
        //     args.color = Colors.red;
        //   }
        // },

        //
        // onTrackballPositionChanging: (TrackballArgs args) {
        //   final chartInfo = args.chartPointInfo;
        //   args.chartPointInfo.label = chartInfo.header;
        // },
        // trackballBehavior: TrackballBehavior(
        //   enable: true
        // ),

        //
        // onLegendItemRender: (LegendRenderArgs args) => args.seriesIndex = 2,
        
        // crosshairBehavior: CrosshairBehavior(enable: true),
        // onCrosshairPositionChanging: (CrosshairRenderArgs args) => crosshair(args),

        //
        zoomPanBehavior: ZoomPanBehavior(
          enableDoubleTapZooming: true,
          enablePanning: true,
          enablePinching: true,
          enableSelectionZooming: true
        ),
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
        

        legend: Legend(isVisible: true),
        title: ChartTitle(text: 'Half yearly sales analysis'),
        primaryXAxis: CategoryAxis(),
        series: <StackedBarSeries<SalesData, String>>[
          dataSourceChart(),
          StackedBarSeries<SalesData, String>(
            dataSource: dataSource,
            sortingOrder: SortingOrder.descending,
            sortFieldValueMapper: (SalesData item, _) => item.color,
            pointColorMapper: (SalesData item, _) => Colors.yellow,
            xValueMapper: (SalesData item, _) => item.color,
            yValueMapper: (SalesData item, _) => item.data[0]
          ),
          StackedBarSeries<SalesData, String>(
            dataSource: dataSource,
            sortingOrder: SortingOrder.descending,
            sortFieldValueMapper: (SalesData item, _) => item.color,
            pointColorMapper: (SalesData item, _) => Colors.green,
            xValueMapper: (SalesData item, _) => item.color,
            yValueMapper: (SalesData item, _) => item.data[0]
          )
        ]
      ),
      // child: SfSparkBarChart(
      //   data: <double>[18, 24, 30, 14, 28]
      // )
    );
  }

  dataSourceChart() {
    return StackedBarSeries<SalesData, String>(
      dataSource: dataSource,

      //
      sortingOrder: SortingOrder.descending,
      sortFieldValueMapper: (SalesData item, _) => item.color,
      
      //
      pointColorMapper: (SalesData item, _) => Colors.red,
      
      //
      xValueMapper: (SalesData item, _) => item.color,
      yValueMapper: (SalesData item, _) => item.data[0],

      //
      dataLabelMapper: (SalesData item, _) => 'Hello ${item.color}',
      dataLabelSettings: DataLabelSettings(
          isVisible: true,

          //
          alignment: ChartAlignment.center,
          labelAlignment: ChartDataLabelAlignment.middle,
          
          textStyle: TextStyle(color: Colors.black),
          // color: Colors.black
          opacity: 0.5,
          color: Colors.green,


          //
          margin: EdgeInsets.all(2),
          borderRadius: 1,
          borderColor: Colors.black,
          borderWidth: 2,

          // useSeriesColor: true
          angle: 20,

          // builder: (dynamic data, dynamic point, dynamic series, int pointIndex, int seriesIndex) {
          //   return Container(
          //     height: 30,
          //     width: 30,
          //     color: Colors.black,
          //   );
          // }
          showCumulativeValues:true,
          showZeroValue: false
      )
    );
  }

  void crosshair(CrosshairRenderArgs args) {
      args.text = 'crosshair';
  }

  void zoom(ZoomPanArgs args) {
      print(args.currentZoomPosition);
  }

  void tool(TooltipArgs args) {
     args.locationX = 30;
  }
}

class SalesData {
  final String color;
  List<int> data = [];
  SalesData({this.color}) {
    data.add(randomValue());
    data.add(randomValue());
    data.add(randomValue());
  }

  List<SalesData> mockDate() {
    List<SalesData> list = [];
    list.add(SalesData(color: 'Pink'));
    list.add(SalesData(color: 'Green'));
    list.add(SalesData(color: 'Blue'));
    list.add(SalesData(color: 'Red'));
    list.add(SalesData(color: 'Purple'));
    return list;
  }

  int randomValue() {
    final random = Random();
    return 20 + random.nextInt(30);
  }
}