import 'package:compare_vehicle/widget/module.dart';
import 'package:flutter/material.dart';

class ModelBody extends StatefulWidget {
  const ModelBody({ Key key }) : super(key: key);

  @override
  _ModelBodyState createState() => _ModelBodyState();
}

class _ModelBodyState extends State<ModelBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _modelItem(),
              _modelItem(),
              _modelItem(),
              TTAnimationExpand(child: Container(height: 40), hasExpand: true,)
            ],
          ),
        )
      ]
    );
  }

  Widget _modelItem() {
    return Container(
      height: 260,
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Color(0xFFFF000000)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            'https://cdn2.iconfinder.com/data/icons/sketchy-basic-icons/94/truck-512.png',
            height: 130,
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                height: 44,
                child: Text('2020 KONA Electric',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'HyundaiSansHead',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                child: Text.rich(
                  TextSpan(
                    text: 'From ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'HyundaiSansHead',
                    ),
                    children: [
                      TextSpan(
                        text: 'Rp. 460.100.000',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'HyundaiSansHead',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ]
                  )
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(width: 1.0, color: Color(0xFFFF000000))),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Trim View',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'HyundaiSansHead',
                  ),
                ),
                Icon(Icons.arrow_upward)
              ],
            )
          )
        ],
      )
    );
  }
}