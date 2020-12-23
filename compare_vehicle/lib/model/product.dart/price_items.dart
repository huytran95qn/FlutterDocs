class PriceItems {
  String _priceItemName;
  double _priceItemValue;

  PriceItems({String priceItemName, double priceItemValue}) {
    this._priceItemName = priceItemName;
    this._priceItemValue = priceItemValue;
  }

  String get priceItemName => _priceItemName;
  set priceItemName(String priceItemName) => _priceItemName = priceItemName;

  double get priceItemValue => _priceItemValue;
  set priceItemValue(double priceItemValue) => _priceItemValue = priceItemValue;

  PriceItems.fromJson(Map<String, dynamic> json) {
    _priceItemName = json['priceItemName'];
    _priceItemValue = json['priceItemValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['priceItemName'] = this._priceItemName;
    data['priceItemValue'] = this._priceItemValue;
    return data;
  }
}