import 'package:flutter/material.dart';

class StackedBarChart extends StatefulWidget {
  final String chartTypes;
  final String axisTypes;
  final String userInteraction;
  final String legends;
  final String dynamicUpdate;
  const StackedBarChart({ Key key, this.chartTypes, this.axisTypes, this.userInteraction, this.legends, this.dynamicUpdate }) : super(key: key);

  @override
  _StackedBarChartState createState() => _StackedBarChartState();
}

class _StackedBarChartState extends State<StackedBarChart> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.deepOrange);
  }
}