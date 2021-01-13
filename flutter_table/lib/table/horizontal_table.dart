import 'package:flutter/material.dart';
import 'package:flutter_table/horizontal_data_table/horizontal_data_table.dart';
import 'package:flutter_table/model/user/user.dart';

class HorizontalTable extends StatefulWidget {
  final List<UserInfo> userChild;
  const HorizontalTable({ Key key, this.userChild }) : super(key: key);

  @override
  _HorizontalTableState createState() => _HorizontalTableState();
}

class _HorizontalTableState extends State<HorizontalTable> {
  static const int sortName = 0;
  static const int sortStatus = 1;
  bool isAscending = true;
  int sortType = sortName;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return _getBodyWidget(context);
  }

  Widget _getBodyWidget(BuildContext _ctx) {
    return Container(
      child: HorizontalDataTable(
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        sideChildren: _generateAdditional(),
        itemCount: widget.userChild.length,
        rowSeparatorWidget: const Divider(
          color: Colors.black54,
          height: 1.0,
          thickness: 0.0,
        ),
        sideColBackgroundColor: Color(0xFFFFFFFF),
        isScroll: false,
      ),
      height: MediaQuery.of(context).size.height,
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      // FlatButton(
      //   padding: EdgeInsets.all(0),
      //   child: _getTitleItemWidget('Name' + (sortType == sortName ? (isAscending ? '↓' : '↑') : '')),
      //   onPressed: () {
      //     sortType = sortName;
      //     isAscending = !isAscending;
      //     user.sortName(isAscending);
      //     setState(() {});
      //   },
      // ),
      // FlatButton(
      //   padding: EdgeInsets.all(0),
      //   child: _getTitleItemWidget('Status' + (sortType == sortStatus ? (isAscending ? '↓' : '↑') : '')),
      //   onPressed: () {
      //     sortType = sortStatus;
      //     isAscending = !isAscending;
      //     user.sortStatus(isAscending);
      //     setState(() {});
      //   },
      // ),
      _getTitleItemWidget('Name'),
      _getTitleItemWidget('Status'),
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

  List<Widget> _generateAdditional() {
    List<Widget> _item = [];
    for (var index = 0; index < widget.userChild.length; index++) {
      _item.add(_generateRightHandSideColumnRow(index));
    }

    return _item;
  }

  Widget _generateRightHandSideColumnRow(int index) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            child: Text(widget.userChild[index].name),
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
                    widget.userChild[index].status
                        ? Icons.notifications_off
                        : Icons.notifications_active,
                    color:
                        widget.userChild[index].status ? Colors.red : Colors.green),
                Text(widget.userChild[index].status ? 'Disabled' : 'Active')
              ],
            ),
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          )
        ),
        Expanded(
          child: Container(
            child: Text(widget.userChild[index].phone),
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          )
        ),
        Expanded(
          child: Container(
            child: Text(widget.userChild[index].registerDate),
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
            child: Text(widget.userChild[index].terminationDate),
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