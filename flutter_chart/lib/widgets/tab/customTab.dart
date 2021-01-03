import 'package:flutter/material.dart';

class CustomTabWidget {
  Widget header;
  Widget body;
  VoidCallback onPress;

  CustomTabWidget({@required header, @required body, @required this.onPress}) {
    this.header = header;
    this.body = body;
    this.onPress = onPress;
  }
}

class CustomTab extends StatefulWidget {
  final List<CustomTabWidget> children;
  final Color indicatorColor;
  final Color backgroundColor;
  const CustomTab({
      Key key,
      @required this.children,
      this.indicatorColor = const Color(0xff00aad2),
      this.backgroundColor = Colors.white
  }) : super(key: key);

  @override
  _CustomTabState createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> with SingleTickerProviderStateMixin {
  TabController controller;
  List<Widget> tabsHeader = [];
  List<Widget> tabsBody = [];

  @override
  void initState(){
    controller = new TabController(vsync: this, length: widget.children.length);
    super.initState();
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    generateTabs();
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: TabBar(
            indicatorColor: widget.indicatorColor,
            indicatorWeight: 2.5,
            labelStyle: TextStyle(fontWeight: FontWeight.w800),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
            controller: controller,
            tabs: tabsHeader,
            onTap: (index) {
              widget.children[index].onPress.call();
            }
          )
        ),
        Expanded(
          child: TabBarView(
            controller: controller,
            children: tabsBody
          )
        )
      ]
    );
  }

  void generateTabs() {
    resetTabs();
    for (var i = 0; i < widget.children.length; i++) {
      tabsHeader.add(widget.children[i].header);
      tabsBody.add(widget.children[i].body);
    }
  }

  void resetTabs() {
    tabsHeader.clear();
    tabsBody.clear();
  }
}