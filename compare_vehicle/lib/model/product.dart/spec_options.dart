import 'package:compare_vehicle/model/module.dart';

class SpecOptions {
  String _categoryTypeEnum;
  String _categoryTypeDisplayName;
  List<SpecOptionItems> _specOptionItems;

  SpecOptions({
      String categoryTypeEnum,
      String categoryTypeDisplayName,
      List<SpecOptionItems> specOptionItems
  }) {
    this._categoryTypeEnum = categoryTypeEnum;
    this._categoryTypeDisplayName = categoryTypeDisplayName;
    this._specOptionItems = specOptionItems;
  }

  String get categoryTypeEnum => _categoryTypeEnum;
  set categoryTypeEnum(String categoryTypeEnum) => _categoryTypeEnum = categoryTypeEnum;
  
  String get categoryTypeDisplayName => _categoryTypeDisplayName;
  set categoryTypeDisplayName(String categoryTypeDisplayName) => _categoryTypeDisplayName = categoryTypeDisplayName;
  
  List<SpecOptionItems> get specOptionItems => _specOptionItems;
  set specOptionItems(List<SpecOptionItems> specOptionItems) => _specOptionItems = specOptionItems;

  SpecOptions.fromJson(Map<String, dynamic> json) {
    _categoryTypeEnum = json['categoryTypeEnum'];
    _categoryTypeDisplayName = json['categoryTypeDisplayName'];
    if (json['specOptionItems'] != null) {
      _specOptionItems = new List<SpecOptionItems>();
      json['specOptionItems'].forEach((v) {
        _specOptionItems.add(new SpecOptionItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryTypeEnum'] = this._categoryTypeEnum;
    data['categoryTypeDisplayName'] = this._categoryTypeDisplayName;
    if (this._specOptionItems != null) {
      data['specOptionItems'] =
          this._specOptionItems.map((v) => v.toJson()).toList();
    }
    return data;
  }
}