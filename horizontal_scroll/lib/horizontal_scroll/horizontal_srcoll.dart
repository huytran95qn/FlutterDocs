import 'package:flutter/material.dart';
import 'package:horizontal_scroll/widgets/size/measure_size.dart';

class HorizontalScroll extends StatefulWidget {
  final List<Widget> children;
  const HorizontalScroll({ Key key, @required this.children }) : super(key: key);

  @override
  _HorizontalScrollState createState() => _HorizontalScrollState();
}

class _HorizontalScrollState extends State<HorizontalScroll> {
  double _widthContainer = 0;
  double _widthListView = 0;
  bool _setStateAgain = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _widthContainer < _widthListView ? FlatButton(
          onPressed: () => {},
          height: 20,
          minWidth: 100,
          color: Colors.yellow,
          child: Text('Left'),
        ) : SizedBox(),

        Expanded(
          child: _getContainer(),
        ),

        _widthContainer < _widthListView ? FlatButton(
          onPressed: () => {},
          height: 20,
          minWidth: 100,
          color: Colors.green,
          child: Text('Right'),
        ) : SizedBox()
      ],
    );
  }

  Widget _getContainer() {
    return MeasureSize(
      onChange:(size) {
        print('---------------------');
        print('Container HorizontalScroll');
        print('height: ${size.height}');
        print('width: ${size.width}');
        print('---------------------');
        _widthContainer = size.width;
      },
      child: Container(
        height: 200,
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: _getListView()
      )
    );
  }

  Widget _getListView() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        MeasureSize(
          onChange:(size) {
            print('---------------------');
            print('List View HorizontalScroll');
            print('height: ${size.height}');
            print('width: ${size.width}');
            print('---------------------');
            _widthListView = size.width;
            if(_widthContainer < _widthListView && _setStateAgain) {
              setState(() {
                _widthListView = size.width;
                _setStateAgain = false;
              });
            }
          },
          child: Row(
            children: widget.children
          )
        )
      ]
    );
  }
}