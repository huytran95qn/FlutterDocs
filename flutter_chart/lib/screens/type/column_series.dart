import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../mock_data.dart';

class ColumnSeriesChart {
  List<PopularColorData> dataSource;
  ColumnSeriesChart() {
    this.dataSource = new PopularColorData().mockDate();
  }

  series() {
    return <ColumnSeries<PopularColorData, String>>[
      ColumnSeries<PopularColorData, String>(
        dataSource: dataSource,
        sortingOrder: SortingOrder.descending,
        sortFieldValueMapper: (PopularColorData item, _) => item.color,
        pointColorMapper: (PopularColorData item, _) => Colors.red,
        xValueMapper: (PopularColorData item, _) => item.color,
        yValueMapper: (PopularColorData item, _) => item.data[0].percentage
      ),
      ColumnSeries<PopularColorData, String>(
        dataSource: dataSource,
        sortingOrder: SortingOrder.descending,
        sortFieldValueMapper: (PopularColorData item, _) => item.color,
        pointColorMapper: (PopularColorData item, _) => Colors.yellow,
        xValueMapper: (PopularColorData item, _) => item.color,
        yValueMapper: (PopularColorData item, _) => item.data[1].percentage
      ),
      ColumnSeries<PopularColorData, String>(
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