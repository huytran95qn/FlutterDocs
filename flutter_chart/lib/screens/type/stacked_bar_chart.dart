import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../mock_data.dart';

class StackedBarChart {
  List<PopularColorData> dataSource;
  SelectionBehavior selection;
  StackedBarChart({this.selection}) {
    this.dataSource = new PopularColorData().mockDate();
  }

  series() {
    return <StackedBarSeries<PopularColorData, String>>[
      StackedBarSeries<PopularColorData, String>(
        dataSource: dataSource,
        sortingOrder: SortingOrder.descending,
        sortFieldValueMapper: (PopularColorData item, _) => item.color,
        pointColorMapper: (PopularColorData item, _) => Colors.red,
        xValueMapper: (PopularColorData item, _) => item.color,
        yValueMapper: (PopularColorData item, _) => item.data[0].percentage,
        selectionBehavior: selection != null ? selection : null
      ),
      StackedBarSeries<PopularColorData, String>(
        dataSource: dataSource,
        sortingOrder: SortingOrder.descending,
        sortFieldValueMapper: (PopularColorData item, _) => item.color,
        pointColorMapper: (PopularColorData item, _) => Colors.yellow,
        xValueMapper: (PopularColorData item, _) => item.color,
        yValueMapper: (PopularColorData item, _) => item.data[1].percentage,
        selectionBehavior: selection != null ? selection : null
      ),
      StackedBarSeries<PopularColorData, String>(
        dataSource: dataSource,
        sortingOrder: SortingOrder.descending,
        sortFieldValueMapper: (PopularColorData item, _) => item.color,
        pointColorMapper: (PopularColorData item, _) => Colors.green,
        xValueMapper: (PopularColorData item, _) => item.color,
        yValueMapper: (PopularColorData item, _) => item.data[2].percentage,
        selectionBehavior: selection != null ? selection : null
      )
    ];
  }
}