import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../mock_data.dart';

class StackedBarChartSeries {
  List<PopularColorData> dataSource;
  StackedBarChartSeries() {
    this.dataSource = new PopularColorData().mockDate();
  }

  barChartSeries() {
    return <StackedBarSeries<PopularColorData, String>>[
      StackedBarSeries<PopularColorData, String>(
        dataSource: dataSource,
        sortingOrder: SortingOrder.descending,
        sortFieldValueMapper: (PopularColorData item, _) => item.color,
        pointColorMapper: (PopularColorData item, _) => Colors.red,
        xValueMapper: (PopularColorData item, _) => item.color,
        yValueMapper: (PopularColorData item, _) => item.data[0].percentage
      ),
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
    ];
  }
}