import 'package:flutter/material.dart';
import 'package:flutter_table/model/user/user.dart';

class HorizontalTable extends StatefulWidget {
  const HorizontalTable({ Key key }) : super(key: key);

  @override
  _HorizontalTableState createState() => _HorizontalTableState();
}

class _HorizontalTableState extends State<HorizontalTable> {
  User user = new User();
  static const int sortName = 0;
  static const int sortStatus = 1;
  bool isAscending = true;
  int sortType = sortName;
  
  @override
  void initState() {
    user.initData(100);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return _getHeader();
  }

  Widget _getHeader() {
    return Row(
      children: [
        _getTitleItemWidget('Name', 200),
        _getTitleItemWidget('Status', 200),
        _getTitleItemWidget('Phone', 200),
        _getTitleItemWidget('Register', 100),
        _getTitleItemWidget('Termination', 200),
        _getTitleItemWidget('Action', 50),
      ],
    );
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      child: Text(user.userInfo[index].name),
      width: 100,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }
}