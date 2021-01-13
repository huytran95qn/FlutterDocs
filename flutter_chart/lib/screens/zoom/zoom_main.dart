import 'package:flutter/material.dart';
import 'package:flutter_chart/screens/zoom/module.dart';
import 'package:flutter_chart/widgets/tab/module.dart';

class ZoomMain extends StatefulWidget {
  const ZoomMain({ Key key }) : super(key: key);

  @override
  _ZoomMainState createState() => _ZoomMainState();
}

class _ZoomMainState extends State<ZoomMain> {
  @override
  Widget build(BuildContext context) {
    return CustomTab(
      children: [
        CustomTabWidget(
          header: Text('Default', style: TextStyle(color: Colors.black)),
          body: ZoomChart(),
          onPress: () => {}
        ),
        CustomTabWidget(
          header: Text('Zoom Selector', style: TextStyle(color: Colors.black)),
          body: ZoomSelectorChart(),
          onPress: () => {}
        )
      ]
    );
  }
}