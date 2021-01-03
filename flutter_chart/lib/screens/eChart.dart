import 'package:flutter/material.dart';
import 'package:flutter_chart/screens/mock_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class EChart extends StatefulWidget {
  const EChart({ Key key }) : super(key: key);

  @override
  _EChartState createState() => _EChartState();
}

class _EChartState extends State<EChart> {
  List<PopularColorData> dataSource;
  ZoomPanBehavior zooming;
  @override
  Widget build(BuildContext context) {
    dataSource = new PopularColorData().mockDate();
    zooming = ZoomPanBehavior(
      enableSelectionZooming: true,
      enableDoubleTapZooming: true,
      enablePinching: true,
      enablePanning: true
    );
    return Container(
      padding: EdgeInsets.all(16),
      child: SfCartesianChart(
        backgroundColor: Colors.white10,
        title: ChartTitle(text: 'Default'),
        primaryXAxis: CategoryAxis(),
        //// ---------------------------------------------------
        //// Color of the chart border.
        // borderColor: Colors.blue,
        // borderWidth: 1,
        //// ---------------------------------------------------


        //// ---------------------------------------------------
        //// Background color of the plot area
        // plotAreaBackgroundColor: Colors.grey.withOpacity(0.5),
        // plotAreaBorderColor: Colors.blue,
        // plotAreaBorderWidth: 5,
        // plotAreaBackgroundImage: Image.asset(name)
        //// ----------------------------------------------------


        //// ---------------------------------------------------
        //// Axis and data label
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
        //// ---------------------------------------------------
        

        //// ---------------------------------------------------
        // Creating an argument constructor of Legend class.
        // legend: Legend(
        //   isVisible: true,
        //   position: LegendPosition.bottom
        // ),
        //// ---------------------------------------------------
        
        //// don't know
        //// ---------------------------------------------------
        // onTrendlineRender: (TrendlineRenderArgs args) => trendline(args),
        //// ---------------------------------------------------

        //// ---------------------------------------------------
        //// don't know
        // axes: <ChartAxis>[
        //   NumericAxis(
        //     majorGridLines: MajorGridLines(color: Colors.red, width: 20, dashArray: [1, 2])
        //   )
        // ],
        // enableSideBySideSeriesPlacement: false,
        //// ---------------------------------------------------
        
        //// onPointTapped
        //// onDataLabelTapped
        //// onAxisLabelTapped
        //// onLegendTapped
        //
        // onLegendItemRender: (LegendRenderArgs args) => args.seriesIndex = 2,
        series: <StackedBarSeries<PopularColorData, String>>[
          dataSourceChart(),
          StackedBarSeries<PopularColorData, String>(
            dataSource: dataSource,
            sortingOrder: SortingOrder.descending,
            sortFieldValueMapper: (PopularColorData item, _) => item.color,
            pointColorMapper: (PopularColorData item, _) => Colors.yellow,
            xValueMapper: (PopularColorData item, _) => item.color,
            yValueMapper: (PopularColorData item, _) => item.data[1].percentage
          ),
          StackedBarSeries<PopularColorData, String>(
            dataSource: dataSource,
            sortingOrder: SortingOrder.descending,
            sortFieldValueMapper: (PopularColorData item, _) => item.color,
            pointColorMapper: (PopularColorData item, _) => Colors.green,
            xValueMapper: (PopularColorData item, _) => item.color,
            yValueMapper: (PopularColorData item, _) => item.data[2].percentage
          )
        ]
      ),
      // child: SfSparkBarChart(
      //   data: <double>[18, 24, 30, 14, 28]
      // )
    );
  }

  dataSourceChart() {
    return StackedBarSeries<PopularColorData, String>(
      dataSource: dataSource,

      //
      sortingOrder: SortingOrder.descending,
      sortFieldValueMapper: (PopularColorData item, _) => item.color,
      
      //
      pointColorMapper: (PopularColorData item, _) => Colors.red,
      
      //
      xValueMapper: (PopularColorData item, _) => item.color,
      yValueMapper: (PopularColorData item, _) => item.data[0].percentage,

      //
      dataLabelMapper: (PopularColorData item, _) => 'Hello ${item.data[0].name}',
      dataLabelSettings: DataLabelSettings(
          isVisible: true,

          //
          alignment: ChartAlignment.center,
          labelAlignment: ChartDataLabelAlignment.middle,
          
          textStyle: TextStyle(color: Colors.black),
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

  toolTip(ColorData data) {
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

  void trendline(TrendlineRenderArgs args) {
    print('trendline');
    print(args.seriesIndex);
  }

  void trackball(TrackballArgs args) {
    args.chartPointInfo.label = '${args.chartPointInfo.header} - ${args.chartPointInfo.label}';
  }
}