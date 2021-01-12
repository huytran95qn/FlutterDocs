///Exxport File

///Wrapper Controller
export 'package:flutter_table/horizontal_data_table/refresh/hdt_refresh_controller.dart';

///Available Refresh Header
export 'package:flutter_table/horizontal_data_table/refresh/pull_to_refresh/src/indicator/classic_indicator.dart';
export 'package:flutter_table/horizontal_data_table/refresh/pull_to_refresh/src/indicator/waterdrop_header.dart';
export 'package:flutter_table/horizontal_data_table/refresh/pull_to_refresh/src/indicator/custom_indicator.dart';
export 'package:flutter_table/horizontal_data_table/refresh/pull_to_refresh/src/indicator/link_indicator.dart';
export 'package:flutter_table/horizontal_data_table/refresh/pull_to_refresh/src/indicator/material_indicator.dart';
export 'package:flutter_table/horizontal_data_table/refresh/pull_to_refresh/src/indicator/bezier_indicator.dart';

///Main File
import 'package:flutter/material.dart';
import 'package:flutter_table/horizontal_data_table/model/scroll_shadow_model.dart';
import 'package:flutter_table/horizontal_data_table/refresh/non_bounce_back_scroll_physics.dart';
import 'package:flutter_table/horizontal_data_table/refresh/hdt_refresh_controller.dart';
import 'package:flutter_table/horizontal_data_table/refresh/pull_to_refresh/src/smart_refresher.dart';

import 'package:provider/provider.dart';

///
/// For sorting issue, will based on the header fixed widget for flexible handling, suggest using [FlatButton] to control the data sorting
///
///
class HorizontalDataTable extends StatefulWidget {
  final bool isScroll;
  final List<Widget> headerWidgets;

  ///Direct create children
  final List<Widget> sideChildren;

  ///Suggest use builder for easier manage, like data update
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  ///Row Divider

  ///This is apply to all remaining data row of the list view
  final Widget rowSeparatorWidget;
  
  final Color sideColBackgroundColor;

  const HorizontalDataTable({
    this.headerWidgets,
    this.itemBuilder,
    this.itemCount = 0,
    this.rowSeparatorWidget = const Divider(
      color: Colors.transparent,
      height: 0.0,
      thickness: 0.0,
    ),
    this.sideColBackgroundColor,
    this.isScroll = true,
    this.sideChildren,
  });

  @override
  State<StatefulWidget> createState() {
    return _HorizontalDataTableState();
  }
}

class _HorizontalDataTableState extends State<HorizontalDataTable> {
  ScrollController _viewScrollCtrl = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _getParallelListView();
  }

  Widget _getParallelListView() {
    return Container(
      color: widget.sideColBackgroundColor,
      padding: EdgeInsets.only(left: 24),
      child: _getSideFixedHeaderScrollColumn(),
    );
  }

  Widget _getSideFixedHeaderScrollColumn() {
    List<Widget> _widgetList = [];
    List<Widget> _widgetHeaderList = [];

    // create list header widget
    for (var i = 0; i < widget.headerWidgets.length; i++) {
      final _headerWidget = widget.headerWidgets[i];
      final _container = Expanded(
        child: _headerWidget,
      );
      
      _widgetHeaderList.add(_container);
    }

    // add header widget
    _widgetList.add(
      Container(
        child: Row(children: _widgetHeaderList),
      )
    );

    // add separator widget
    _widgetList.add(widget.rowSeparatorWidget);

    //ListView
    _widgetList.add(Expanded(child: _getSideListView(),));

    return Column(children: _widgetList);
  }

  Widget _getSideListView() {
    return _getListView(
      _viewScrollCtrl,
      widget.itemBuilder,
      widget.itemCount,
      widget.sideChildren
    );
  }

  Widget _getListView(ScrollController scrollController, 
    IndexedWidgetBuilder indexedWidgetBuilder, 
    int itemCount,
    List<Widget> children
  ) {
    if(widget.isScroll == true) {
      return ListView.separated(
        controller: scrollController,
        itemBuilder: indexedWidgetBuilder,
        itemCount: itemCount,
        separatorBuilder: (context, index) {
          return widget.rowSeparatorWidget;
        },
      );
    }

    return Column(
      children: children,
    );
  }
}