import 'package:flutter/material.dart';
import 'package:horizontal_scroll/horizontal_scroll/module.dart';
import 'package:horizontal_scroll/scroll_to_index/module.dart';

enum DirectionScroll { left, right }
class HorizontalScroll extends StatefulWidget {
  final List<Widget> children;
  const HorizontalScroll({ Key key, @required this.children }) : super(key: key) ;

  @override
  _HorizontalScrollState createState() => _HorizontalScrollState();
}

class _HorizontalScrollState extends State<HorizontalScroll> {
  int totalCount = 0;
  int currentIndex = 0;
  AutoScrollController controller;
  final Axis scrollDirection = Axis.horizontal;

  @override
  void initState() {
    super.initState();
    controller = AutoScrollController(axis: scrollDirection);
    controller.addListener(() {
      print('---------------------');
      print('Container HorizontalScroll');
      print('height: ${controller.offset}');
      print('---------------------');
    });
  }

  @override
  Widget build(BuildContext context) {
    totalCount = widget.children.length;
    return Row(
      children: [
        currentIndex > 1 ? FlatButton(
          onPressed: () => _scrollToIndex(DirectionScroll.left),
          height: 20,
          minWidth: 100,
          color: Colors.yellow,
          child: Text('Left'),
        ) : SizedBox(),

        Expanded(
          child: _getContainer(),
        ),

        currentIndex < totalCount - 4 ? FlatButton(
          onPressed: () => _scrollToIndex(DirectionScroll.right),
          height: 20,
          minWidth: 100,
          color: Colors.green,
          child: Text('Right'),
        ) : SizedBox()
      ],
    );
  }

  Widget _getContainer() {
    return Container(
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: _getListView()
    );
  }

  Widget _getListView() {
    final dataSource = widget.children.isNotEmpty ? new HorizontalDataSource(children: widget.children, controller: controller).dataSource : [SizedBox()];
    return ListView(
      scrollDirection: scrollDirection, 
      controller: controller,
      children: dataSource
    );
  }

  Future _scrollToIndex(DirectionScroll direction) async {
    switch (direction) {
      case DirectionScroll.left:
        if(currentIndex > 0) {
          currentIndex--;
        }
        break;

      case DirectionScroll.right:
        if(currentIndex < totalCount) {
          currentIndex++;
        }
        break;

      default:
        return;
    }

    setState(() {});
    await controller.scrollToIndex(currentIndex, preferPosition: AutoScrollPosition.begin);
  }
}