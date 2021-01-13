import 'package:flutter/material.dart';
import 'package:flutter_chart/screens/mock_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'Axis/category_axis.dart';

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
        primaryXAxis: new CategoryAxisDemo().axisCustomization(),
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
        legend: Legend(
          isVisible: true,
          position: LegendPosition.bottom
        ),
        onLegendItemRender: (LegendRenderArgs args) {
          args.text = dataSource[0].data[args.seriesIndex].name;
          print(args);
        },
        //// ---------------------------------------------------
        
        //// don't know
        //// ---------------------------------------------------
        // onTrendlineRender: (TrendlineRenderArgs args) => trendline(args),
        //// ---------------------------------------------------

        //// ---------------------------------------------------
        //// learning
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
        series: dataSourceChart()
      ),
      // child: SfSparkBarChart(
      //   data: <double>[18, 24, 30, 14, 28]
      // )
    );
  }

  dataSourceChart() {
    final List<StackedBarSeries<PopularColorData, String>> list = [];
    for (var i = 0; i < dataSource[0].data.length; i++) {
      final item = StackedBarSeries<PopularColorData, String>(
        dataSource: dataSource,

        //
        sortingOrder: SortingOrder.descending,
        sortFieldValueMapper: (PopularColorData item, _) => item.color,
        
        //
        // pointColorMapper: (PopularColorData item, _) => Colors.red,
        
        //
        xValueMapper: (PopularColorData item, _) => item.color,
        yValueMapper: (PopularColorData item, _) => item.data[i].percentage,

        //
        dataLabelMapper: (PopularColorData item, _) => 'Hello ${item.data[i].name}',
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
            // },
            // showCumulativeValues:true,
            // showZeroValue: true
        )
      );
      list.add(item);
    }
    return list;
  }

  void trendline(TrendlineRenderArgs args) {
    print('trendline');
    print(args.seriesIndex);
  }
}