import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../mock_data.dart';

class StackedAreaChart {
  List<PopularColorData> dataSource;
  SelectionBehavior selection;
  StackedAreaChart({this.selection}) {
    this.dataSource = new PopularColorData().mockDate();
  }

  series() {
    return <StackedAreaSeries<PopularColorData, String>>[
      StackedAreaSeries<PopularColorData, String>(
        dataSource: dataSource,
        sortingOrder: SortingOrder.descending,
        sortFieldValueMapper: (PopularColorData item, _) => item.color,
        pointColorMapper: (PopularColorData item, _) => Colors.red,
        xValueMapper: (PopularColorData item, _) => item.color,
        yValueMapper: (PopularColorData item, _) => item.data[0].percentage,
        selectionBehavior: selection != null ? selection : null
      ),
      StackedAreaSeries<PopularColorData, String>(
        dataSource: dataSource,
        sortingOrder: SortingOrder.descending,
        sortFieldValueMapper: (PopularColorData item, _) => item.color,
        pointColorMapper: (PopularColorData item, _) => Colors.yellow,
        xValueMapper: (PopularColorData item, _) => item.color,
        yValueMapper: (PopularColorData item, _) => item.data[1].percentage,
        selectionBehavior: selection != null ? selection : null
      ),
      StackedAreaSeries<PopularColorData, String>(
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