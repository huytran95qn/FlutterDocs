import 'package:flutter/material.dart';
import 'package:flutter_table/table/horizontal_data_table_lib.dart';
import 'package:flutter_table/table/table.dart';

class HorizontalDataTableSample extends StatefulWidget {
  const HorizontalDataTableSample({ Key key }) : super(key: key);

  @override
  _HorizontalDataTableSampleState createState() => _HorizontalDataTableSampleState();
}

class _HorizontalDataTableSampleState extends State<HorizontalDataTableSample> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return HorizontalDataTableLib();
  }
}