import 'package:compare_vehicle/model/module.dart';

class SpecOptionItems {
  String _id;
  String _itemCode;
  String _itemTitle;
  String _itemDescription;
  int _itemPrice;

  SpecOptionItems({
      String id,
      String itemCode,
      String itemTitle,
      String itemDescription,
      int itemPrice
  }) {
    this._id = id;
    this._itemCode = itemCode;
    this._itemTitle = itemTitle;
    this._itemDescription = itemDescription;
    this._itemPrice = itemPrice;
  }

  String get id => _id;
  set id(String id) => _id = id;
  
  String get itemCode => _itemCode;
  set itemCode(String itemCode) => _itemCode = itemCode;
  
  String get itemTitle => _itemTitle;
  set itemTitle(String itemTitle) => _itemTitle = itemTitle;
  
  String get itemDescription => _itemDescription;
  set itemDescription(String itemDescription) => _itemDescription = itemDescription;
  
  int get itemPrice => _itemPrice;
  set itemPrice(int itemPrice) => _itemPrice = itemPrice;

  SpecOptionItems.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _itemCode = json['itemCode'];
    _itemTitle = json['itemTitle'];
    _itemDescription = json['itemDescription'];
    _itemPrice = json['itemPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['itemCode'] = this._itemCode;
    data['itemTitle'] = this._itemTitle;
    data['itemDescription'] = this._itemDescription;
    data['itemPrice'] = this._itemPrice;
    return data;
  }
}