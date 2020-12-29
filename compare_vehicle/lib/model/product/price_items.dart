class PriceItems {
  String _priceItemTypeEnum;
  String _priceItemName;
  int _priceItemValue;

  PriceItems({String priceItemTypeEnum, String priceItemName, int priceItemValue}) {
    this._priceItemTypeEnum = priceItemTypeEnum;
    this._priceItemName = priceItemName;
    this._priceItemValue = priceItemValue;
  }

  String get priceItemTypeEnum => _priceItemTypeEnum;
  set priceItemTypeEnum(String priceItemTypeEnum) => _priceItemTypeEnum = priceItemTypeEnum;

  String get priceItemName => _priceItemName;
  set priceItemName(String priceItemName) => _priceItemName = priceItemName;

  int get priceItemValue => _priceItemValue;
  set priceItemValue(int priceItemValue) => _priceItemValue = priceItemValue;

  PriceItems.fromJson(Map<String, dynamic> json) {
    _priceItemTypeEnum = json['priceItemTypeEnum'];
    _priceItemName = json['priceItemName'];
    _priceItemValue = json['priceItemValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['priceItemTypeEnum'] = this._priceItemTypeEnum;
    data['priceItemName'] = this._priceItemName;
    data['priceItemValue'] = this._priceItemValue;
    return data;
  }
}