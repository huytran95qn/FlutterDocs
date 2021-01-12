import 'package:flutter/material.dart';
import 'package:flutter_table/horizontal_data_table/horizontal_data_table.dart';
import 'package:flutter_table/model/user/user.dart';
import 'package:flutter_table/table/table.dart';

class HorizontalDataTableLib extends StatefulWidget {
  const HorizontalDataTableLib({ Key key }) : super(key: key);

  @override
  _HorizontalDataTableLibState createState() => _HorizontalDataTableLibState();
}

class _HorizontalDataTableLibState extends State<HorizontalDataTableLib> {
  static const int sortName = 0;
  static const int sortStatus = 1;
  bool isAscending = true;
  int sortType = sortName;
  User user = new User();

  @override
  void initState() {
    user.initData(20);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return _getBodyWidget();
  }

  Widget _getBodyWidget() {
    return Container(
      child: HorizontalDataTable(
        headerWidgets: _getTitleWidget(),
        itemBuilder: _generateAdditional,
        itemCount: user.userInfo.length,
        rowSeparatorWidget: const Divider(
          color: Colors.black54,
          height: 1.0,
          thickness: 0.0,
        ),
        sideColBackgroundColor: Color(0xFFFFFFFF),
      ),
      height: MediaQuery.of(context).size.height,
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      FlatButton(
        padding: EdgeInsets.all(0),
        child: _getTitleItemWidget('Name' + (sortType == sortName ? (isAscending ? '↓' : '↑') : '')),
        onPressed: () {
          sortType = sortName;
          isAscending = !isAscending;
          user.sortName(isAscending);
          setState(() {});
        },
      ),
      FlatButton(
        padding: EdgeInsets.all(0),
        child: _getTitleItemWidget('Status' + (sortType == sortStatus ? (isAscending ? '↓' : '↑') : '')),
        onPressed: () {
          sortType = sortStatus;
          isAscending = !isAscending;
          user.sortStatus(isAscending);
          setState(() {});
        },
      ),
      _getTitleItemWidget('Phone'),
      _getTitleItemWidget('Register'),
      _getTitleItemWidget('Termination'),
      _getTitleItemWidget('Action', alignment: Alignment.center),
    ];
  }

  Widget _getTitleItemWidget(String label, {AlignmentGeometry alignment = Alignment.centerLeft }) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: alignment,
    );
  }

  Widget _generateAdditional(BuildContext context, int index) {
    return Column(
      children: [
        _generateRightHandSideColumnRow(context, index),
        HorizontalTable(
          userChild: user.userInfo[index].child,
        )
      ],
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            child: Text(user.userInfo[index].name),
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          )
        ),
        Expanded(
          child: Container(
            child: Row(
              children: <Widget>[
                Icon(
                    user.userInfo[index].status
                        ? Icons.notifications_off
                        : Icons.notifications_active,
                    color:
                        user.userInfo[index].status ? Colors.red : Colors.green),
                Text(user.userInfo[index].status ? 'Disabled' : 'Active')
              ],
            ),
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          )
        ),
        Expanded(
          child: Container(
            child: Text(user.userInfo[index].phone),
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          )
        ),
        Expanded(
          child: Container(
            child: Text(user.userInfo[index].registerDate),
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          )
        ),
        Expanded(
          child: Container(
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: Text(user.userInfo[index].terminationDate),
          )
        ),
        Expanded(
          child: Container(
            child: FlatButton(
              onPressed: () => {},
              child: Icon(Icons.add),
            ),
          )
        ),
      ],
    );
  }
}