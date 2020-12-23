import 'package:compare_vehicle/model/module.dart';

class AccessoryItems {
  String _id;
  bool _has3DContent;
  List<String> _categories;
  String _itemCode;
  String _itemTitle;
  String _itemDescription;
  double _itemPrice;
  List<PriceItems> _priceItems;

  AccessoryItems({
      String id,
      bool has3DContent,
      List<String> categories,
      String itemCode,
      String itemTitle,
      String itemDescription,
      double itemPrice,
      List<PriceItems> priceItems
  }) {
    this._id = id;
    this._has3DContent = has3DContent;
    this._categories = categories;
    this._itemCode = itemCode;
    this._itemTitle = itemTitle;
    this._itemDescription = itemDescription;
    this._itemPrice = itemPrice;
    this._priceItems = priceItems;
  }

  String get id => _id;
  set id(String id) => _id = id;
  
  bool get has3DContent => _has3DContent;
  set has3DContent(bool has3DContent) => _has3DContent = has3DContent;
  
  List<String> get categories => _categories;
  set categories(List<String> categories) => _categories = categories;
  
  String get itemCode => _itemCode;
  set itemCode(String itemCode) => _itemCode = itemCode;
  
  String get itemTitle => _itemTitle;
  set itemTitle(String itemTitle) => _itemTitle = itemTitle;
  
  String get itemDescription => _itemDescription;
  set itemDescription(String itemDescription) => _itemDescription = itemDescription;
  
  double get itemPrice => _itemPrice;
  set itemPrice(double itemPrice) => _itemPrice = itemPrice;
  
  List<PriceItems> get priceItems => _priceItems;
  set priceItems(List<PriceItems> priceItems) => _priceItems = priceItems;

  AccessoryItems.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _has3DContent = json['has3DContent'];
    _categories = json['categories'].cast<String>();
    _itemCode = json['itemCode'];
    _itemTitle = json['itemTitle'];
    _itemDescription = json['itemDescription'];
    _itemPrice = json['itemPrice'];
    if (json['priceItems'] != null) {
      _priceItems = new List<PriceItems>();
      json['priceItems'].forEach((v) {
        _priceItems.add(new PriceItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['has3DContent'] = this._has3DContent;
    data['categories'] = this._categories;
    data['itemCode'] = this._itemCode;
    data['itemTitle'] = this._itemTitle;
    data['itemDescription'] = this._itemDescription;
    data['itemPrice'] = this._itemPrice;
    if (this._priceItems != null) {
      data['priceItems'] = this._priceItems.map((v) => v.toJson()).toList();
    }
    return data;
  }
}