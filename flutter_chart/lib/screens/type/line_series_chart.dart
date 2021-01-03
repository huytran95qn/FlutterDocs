import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../mock_data.dart';

class LineSeriesChart {
  List<PopularColorData> dataSource;
  LineSeriesChart() {
    this.dataSource = new PopularColorData().mockDate();
  }

  series() {
    return <LineSeries<PopularColorData, String>>[
      LineSeries<PopularColorData, String>(
        dataSource: dataSource,
        sortingOrder: SortingOrder.descending,
        sortFieldValueMapper: (PopularColorData item, _) => item.color,
        pointColorMapper: (PopularColorData item, _) => Colors.red,
        xValueMapper: (PopularColorData item, _) => item.color,
        yValueMapper: (PopularColorData item, _) => item.data[0].percentage
      ),
      LineSeries<PopularColorData, String>(
        dataSource: dataSource,
        sortingOrder: SortingOrder.descending,
        sortFieldValueMapper: (PopularColorData item, _) => item.color,
        pointColorMapper: (PopularColorData item, _) => Colors.yellow,
        xValueMapper: (PopularColorData item, _) => item.color,
        yValueMapper: (PopularColorData item, _) => item.data[1].percentage
      ),
      LineSeries<PopularColorData, String>(
        dataSource: dataSource,
        sortingOrder: SortingOrder.descending,
        sortFieldValueMapper: (PopularColorData item, _) => item.color,
        pointColorMapper: (PopularColorData item, _) => Colors.green,
        xValueMapper: (PopularColorData item, _) => item.color,
        yValueMapper: (PopularColorData item, _) => item.data[2].percentage
      )
    ];
  }
}