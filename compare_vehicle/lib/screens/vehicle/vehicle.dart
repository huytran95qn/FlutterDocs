import 'package:compare_vehicle/screens/module.dart';
import 'package:compare_vehicle/widget/module.dart';
import 'package:flutter/material.dart';

class Vehicle extends StatefulWidget {
  const Vehicle({ Key key }) : super(key: key);

  @override
  _VehicleState createState() => _VehicleState();
}

class _VehicleState extends State<Vehicle> with SingleTickerProviderStateMixin {
  TabController controller;
  bool isActive = false;
  bool isActiveModel = true;
  bool isActiveStock = false;

  @override
  void initState(){
    super.initState();
    controller = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 60),
      child: CustomTab(
        children: [
          _modelTab(),
          _stockTab()
        ],
      )
    );
  }

  CustomTabWidget _stockTab() {
    return CustomTabWidget(
      header: Tab(
        child: Text('Stock', style: TextStyle(color: Colors.black, fontSize: 16))
      ),
      body: Container(color: Colors.yellow),
      onPress: () {
        resetTabs();
        setState(() {
          isActiveStock = true;
        });
        print('Hello Body Stock');
      }
    );
  }

  CustomTabWidget _modelTab() {
    return CustomTabWidget(
      header: Tab(
        child: _headerModelTab()
      ),
      body: ModelBody(),
      onPress: () {
        resetTabs();
        setState(() {
          isActiveModel = true;
        });
        print('Hello Body Model');
      }
    );
  }

  Widget _headerModelTab() {
    final icon = isActive ? Icons.folder: Icons.folder_open;
    final text = Text('Model', style: TextStyle(color: Colors.black, fontSize: 16));
    if(isActiveModel) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          text,
          SizedBox(width: 20),
          SizedBox(
            width: 60,
            height: 60,
            child: InkWell(
              splashColor: Colors.red,
              onTap: () {
                setState(() {
                  isActive = !isActive;
                });
              },
              child: Icon(icon, color: Colors.black, size: 46),
            ),
          )
        ],
      );
    } else {
      return text;
    }
  }

  void resetTabs() {
    isActiveModel = false;
    isActiveStock = false;
  }
}