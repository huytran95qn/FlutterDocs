import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CategoryAxisDemo {
  axisCustomization() {
    return CategoryAxis(
      name: 'primaryXAxis',
      // isVisible: false
      title: AxisTitle( text: 'Country'),
      // axisLine: AxisLine(
      //   color: Colors.deepOrange,
      //   width: 2,
      //   dashArray: <double>[5,5]
      // ),
      // rangePadding: ChartRangePadding.normal
      
      // Axis labels will be placed on the ticks
      // labelPlacement: LabelPlacement.betweenTicks,

      // Displaying labels after a fixed interval
      // labelPlacement: LabelPlacement.betweenTicks,
      // interval: 3

      // Edge labels will be shifted
      // edgeLabelPlacement: EdgeLabelPlacement.shift -> **

      // labelPosition: ChartDataLabelPosition.inside,
      // tickPosition: TickPosition.inside,

      // labelRotation: 45,
      // labelIntersectAction: AxisLabelIntersectAction.multipleRows,
      // labelAlignment: LabelAlignment.center

      // isInversed: true, --> note
      // opposedPosition: true

      // maximumLabels: 3, -> note

      // majorTickLines: MajorTickLines(
      //     size: 6,
      //     width: 2,
      //     color: Colors.red
      // ),
      // minorTickLines: MinorTickLines(
      //     size: 4,
      //     width: 2,
      //     color: Colors.blue
      // ),
      // minorTicksPerInterval:10

      // majorGridLines: MajorGridLines(
      //     width: 1,
      //     color: Colors.red,
      //     dashArray: <double>[60,10]
      // ),
      // minorGridLines: MinorGridLines(
      //     width: 0,
      //     color: Colors.green,
      //     dashArray: <double>[5,5]
      // ),
      // minorTicksPerInterval:2

      // labelStyle: TextStyle(
      //   color: Colors.deepOrange,
      //   fontFamily: 'Roboto',
      //   fontSize: 14,
      //   fontStyle: FontStyle.italic,
      //   fontWeight: FontWeight.w500
      // )

      // plotOffset: 0
      // arrangeByIndex: true

      // zoomFactor: 0.5,
      // zoomPosition: 0.2,

      // learning
      // interactiveTooltip: InteractiveTooltip(
      //   connectorLineWidth:2
      // )
      // minimum: 0,
      // maximum: 4
      // visibleMinimum: 0,
      // visibleMaximum: 3

      // learning
      // crossesAt: 50

      // learnig
      // associatedAxisName: 'hello',

      // plotBands: <PlotBand>[
      //   PlotBand(
      //     isVisible: true,
      //     start: 0,
      //     end: 2,
      //   ),
      // ]

      // learning
      // desiredIntervals: 4,
      // interval: 2,

      // maximumLabelWidth: 5,
      // labelsExtent: 15
    );
  }
}