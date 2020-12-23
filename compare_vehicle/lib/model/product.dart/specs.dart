import 'package:compare_vehicle/model/module.dart';

class Specs {
  String _categoryTypeEnum;
  String _categoryTypeDisplayName;
  List<SpecItems> _specItems;

  Specs({
      String categoryTypeEnum,
      String categoryTypeDisplayName,
      List<SpecItems> specItems
  }) {
    this._categoryTypeEnum = categoryTypeEnum;
    this._categoryTypeDisplayName = categoryTypeDisplayName;
    this._specItems = specItems;
  }

  String get categoryTypeEnum => _categoryTypeEnum;
  set categoryTypeEnum(String categoryTypeEnum) => _categoryTypeEnum = categoryTypeEnum;
  
  String get categoryTypeDisplayName => _categoryTypeDisplayName;
  set categoryTypeDisplayName(String categoryTypeDisplayName) => _categoryTypeDisplayName = categoryTypeDisplayName;
  
  List<SpecItems> get specItems => _specItems;
  set specItems(List<SpecItems> specItems) => _specItems = specItems;

  Specs.fromJson(Map<String, dynamic> json) {
    _categoryTypeEnum = json['categoryTypeEnum'];
    _categoryTypeDisplayName = json['categoryTypeDisplayName'];
    if (json['specItems'] != null) {
      _specItems = new List<SpecItems>();
      json['specItems'].forEach((v) {
        _specItems.add(new SpecItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryTypeEnum'] = this._categoryTypeEnum;
    data['categoryTypeDisplayName'] = this._categoryTypeDisplayName;
    if (this._specItems != null) {
      data['specItems'] = this._specItems.map((v) => v.toJson()).toList();
    }
    return data;
  }
}