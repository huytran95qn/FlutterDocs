class ColorProduct {
  String _colorTypeEnum;
  String _colorId;
  String _colorCode;
  String _colorDisplayName;
  int _colorPrice;
  String _colorAdditionalTypeEnum;
  String _colorAdditionalTypeDisplayName;

  ColorProduct({
      String colorTypeEnum,
      String colorId,
      String colorCode,
      String colorDisplayName,
      int colorPrice,
      String colorAdditionalTypeEnum,
      String colorAdditionalTypeDisplayName
  }) {
    this._colorTypeEnum = colorTypeEnum;
    this._colorId = colorId;
    this._colorCode = colorCode;
    this._colorDisplayName = colorDisplayName;
    this._colorPrice = colorPrice;
    this._colorAdditionalTypeEnum = colorAdditionalTypeEnum;
    this._colorAdditionalTypeDisplayName = colorAdditionalTypeDisplayName;
  }

  String get colorTypeEnum => _colorTypeEnum;
  set colorTypeEnum(String colorTypeEnum) => _colorTypeEnum = colorTypeEnum;
  
  String get colorId => _colorId;
  set colorId(String colorId) => _colorId = colorId;
  
  String get colorCode => _colorCode;
  set colorCode(String colorCode) => _colorCode = colorCode;
  
  String get colorDisplayName => _colorDisplayName;
  set colorDisplayName(String colorDisplayName) => _colorDisplayName = colorDisplayName;
  
  int get colorPrice => _colorPrice;
  set colorPrice(int colorPrice) => _colorPrice = colorPrice;
  
  String get colorAdditionalTypeEnum => _colorAdditionalTypeEnum;
  set colorAdditionalTypeEnum(String colorAdditionalTypeEnum) => _colorAdditionalTypeEnum = colorAdditionalTypeEnum;
  
  String get colorAdditionalTypeDisplayName => _colorAdditionalTypeDisplayName;
  set colorAdditionalTypeDisplayName(String colorAdditionalTypeDisplayName) => _colorAdditionalTypeDisplayName = colorAdditionalTypeDisplayName;

  ColorProduct.fromJson(Map<String, dynamic> json) {
    _colorTypeEnum = json['colorTypeEnum'];
    _colorId = json['colorId'];
    _colorCode = json['colorCode'];
    _colorDisplayName = json['colorDisplayName'];
    _colorPrice = json['colorPrice'];
    _colorAdditionalTypeEnum = json['colorAdditionalTypeEnum'];
    _colorAdditionalTypeDisplayName = json['colorAdditionalTypeDisplayName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['colorTypeEnum'] = this._colorTypeEnum;
    data['colorId'] = this._colorId;
    data['colorCode'] = this._colorCode;
    data['colorDisplayName'] = this._colorDisplayName;
    data['colorPrice'] = this._colorPrice;
    data['colorAdditionalTypeEnum'] = this._colorAdditionalTypeEnum;
    data['colorAdditionalTypeDisplayName'] =
        this._colorAdditionalTypeDisplayName;
    return data;
  }
}