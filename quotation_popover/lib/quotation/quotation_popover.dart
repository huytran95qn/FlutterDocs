import 'package:flutter/material.dart';

const Color white = Color(0xffffffff);
const Color golden = Color(0xfff3c300);
const Color black = Color(0xff333333);
const Color dark_80 = Color(0xcc15141f);
const Color pine_green = Color(0xff05141f);

const TextStyle textStyle4 = TextStyle(
  color: Color(0x6effffff),
  fontSize: 20,
  fontFamily: 'KIAM',
);

const TextStyle textStyle5 = const TextStyle(
    fontFamily: 'KIAM',
    color: white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
);

const TextStyle textStyle6 = TextStyle(
  color: Colors.white,
  fontSize: 16,
  fontFamily: 'KIAM',
);

const TextStyle textStyle8 = TextStyle(
  color: Colors.white,
  fontSize: 16,
  fontFamily: 'KIAM',
);

const TextStyle textStyle9 = TextStyle(
  color: golden,
  fontSize: 16,
  fontFamily: 'KIAM',
);

const TextStyle textStyle10 = const TextStyle(
  fontFamily: 'KIAB',
  color: golden,
  fontSize: 30,
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.normal,
);

const TextStyle textStyle13 = TextStyle(
  color: Colors.white,
  fontSize: 16,
  fontFamily: 'KIAL',
);

class QuotationPopover extends StatefulWidget {
  const QuotationPopover({ Key key }) : super(key: key);

  @override
  _QuotationPopoverState createState() => _QuotationPopoverState();
}

class _QuotationPopoverState extends State<QuotationPopover> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 497,
      child: Column(
        children: [
          Spacer(),
          FlatButton(
            onPressed: () => {},
            minWidth: 80,
            height: 30,
            shape: BeveledRectangleBorder(
              side: BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Text('Hello'),
          ),
          _buildListInfo(),
          _buildQuotationBottomBar()
        ],
      ),
    );
  }

  Widget _buildQuotationBottomBar() {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(color: black),
      child: Row(
        children: [
          Text('Total', style: textStyle4),
          SizedBox(width: 14),
          Text('30,240,000', style: textStyle10),
          SizedBox(width: 8),
          Text('원', style: textStyle5),
          Spacer(),
          FlatButton(
            onPressed: () => {},
            child: Container(
              width: 170,
              height: 54,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
              ),
              child: Text('견적서 메일 전송', style: textStyle5),
            )
          ),
        ],
      ),
    );
  }

  Widget _buildListInfo() {
    return Container(
      decoration: BoxDecoration(
        color: dark_80
      ),
      child: Column(
        children: [
          _buildTitleCommon(title: '2.2 디젤', price: '0'),
          _buildTitleCommon(title: '자동 변속기', price: '0'),
          _buildTitleCommon(title: '쏘렌토 2.2 디젤 시그니처', price: '30,240,000'),
          _buildTitleCommon(title: '외장 -  에센스 브라운', price: '80,000'),
          _buildTitleCommon(title: '내장 - 새들 브라운 인테리어', price: '0'),
          _buildListOptions(title: '옵션', price: '2,260,000', isActived: true),
        ],
      ),
    );
  }

  Widget _buildListOptions({ @required String title, @required String price, bool isActived }) {
    return Column(
      children: [
        _buildTitleCommon(title: title, price: price, isActived: isActived),
        _buildTitleCommon(
          title: '드라이브 와이즈',
          titleTextStyle: textStyle13,
          price: '880,000',
          priceTextStyle: textStyle6,
          isActived: isActived
        ),
        _buildTitleCommon(
          title: '7인승',
          titleTextStyle: textStyle13,
          price: '690,000',
          priceTextStyle: textStyle6,
          isActived: isActived
        ),
      ],
    );
  }

  Widget _buildTitleCommon({
    @required String title,
    TextStyle titleTextStyle,
    @required String price,
    TextStyle priceTextStyle,
    bool isActived
  }) {
    titleTextStyle = titleTextStyle ?? textStyle8;
    priceTextStyle = priceTextStyle ?? textStyle9;
    final color = isActived == true ? pine_green : null;
    return Container(
      height: 54,
      color: color,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(title, style: titleTextStyle),
          Spacer(),
          Text('$price 원', style: priceTextStyle),
        ],
      ),
    );
  }
}

class InfoQuotation {
  String name;
  String detail;
  int price;
  List<InfoQuotation> optionals;
}

class QuotationModel {
  List<InfoQuotation> items;
  
}