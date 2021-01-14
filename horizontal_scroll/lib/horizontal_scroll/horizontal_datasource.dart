import 'package:flutter/material.dart';
import 'package:horizontal_scroll/scroll_to_index/module.dart';

class HorizontalDataSource {
  List<Widget> dataSource = [];
  final AutoScrollController controller;
  HorizontalDataSource({@required children, @required this.controller}) {
    _getRows(children);
  }

  List<Widget> _getRows(List<Widget> children) {
    for (var index = 0; index < children.length; index++) {
      dataSource.add(_getRow(index: index, child: children[index]));
    }
    return dataSource;
  }

  Widget _getRow({int index, Widget child}) {
    return _wrapScrollTag(
      index: index,
      child: _wrapScrollTag(index: index, child: child)
    );
  }

  Widget _wrapScrollTag({int index, Widget child}) => AutoScrollTag(
    key: ValueKey(index),
    controller: controller,
    index: index,
    child: child,
    highlightColor: Colors.black.withOpacity(0.1),
  );
}