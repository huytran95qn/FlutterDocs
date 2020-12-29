import 'package:compare_vehicle/model/module.dart';

class ModelGroups {
  String modelEnum;
  String modelDisplayName;
  String modelMappingKey;
  String modelYearEnum;
  String modelYearDisplayName;
  String modelYearMappingKey;
  bool isSelected;
  List<Products> products;

  ModelGroups({Products product}) {
    this.modelEnum = product.modelEnum;
    this.modelDisplayName = product.modelDisplayName;
    this.modelMappingKey = product.modelMappingKey;
    this.modelYearEnum = product.modelYearEnum;
    this.modelYearDisplayName = product.modelYearDisplayName;
    this.modelYearMappingKey = product.modelYearMappingKey;
    this.products = [product];
    this.isSelected = false;
  }
}
class Products {
  String _id;
  String _languageCodeEnum;
  String _modelEnum;
  String _modelDisplayName;
  String _modelMappingKey;
  String _modelYearEnum;
  String _modelYearDisplayName;
  String _modelYearMappingKey;
  String _trimEnum;
  String _trimDisplayName;
  String _trimMappingKey;
  String _variantEnum;
  String _variantDisplayName;
  String _variantLongDisplayName;
  String _variantMappingKey;
  int _modelDisplayOrder;
  int _trimDisplayOrder;
  int _variantDisplayOrder;
  List<FscDependencies> _fscDependencies;
  bool _isActive;

  Products({
      String id,
      String languageCodeEnum,
      String modelEnum,
      String modelDisplayName,
      String modelMappingKey,
      String modelYearEnum,
      String modelYearDisplayName,
      String modelYearMappingKey,
      String trimEnum,
      String trimDisplayName,
      String trimMappingKey,
      String variantEnum,
      String variantDisplayName,
      String variantLongDisplayName,
      String variantMappingKey,
      int modelDisplayOrder,
      int trimDisplayOrder,
      int variantDisplayOrder,
      List<FscDependencies> fscDependencies,
      bool isActive
  }) {
    this._id = id;
    this._languageCodeEnum = languageCodeEnum;
    this._modelEnum = modelEnum;
    this._modelDisplayName = modelDisplayName;
    this._modelMappingKey = modelMappingKey;
    this._modelYearEnum = modelYearEnum;
    this._modelYearDisplayName = modelYearDisplayName;
    this._modelYearMappingKey = modelYearMappingKey;
    this._trimEnum = trimEnum;
    this._trimDisplayName = trimDisplayName;
    this._trimMappingKey = trimMappingKey;
    this._variantEnum = variantEnum;
    this._variantDisplayName = variantDisplayName;
    this._variantLongDisplayName = variantLongDisplayName;
    this._variantMappingKey = variantMappingKey;
    this._modelDisplayOrder = modelDisplayOrder;
    this._trimDisplayOrder = trimDisplayOrder;
    this._variantDisplayOrder = variantDisplayOrder;
    this._fscDependencies = fscDependencies;
    this._isActive = isActive;
  }

  String get id => _id;
  set id(String id) => _id = id;
  
  String get languageCodeEnum => _languageCodeEnum;
  set languageCodeEnum(String languageCodeEnum) => _languageCodeEnum = languageCodeEnum;
  
  String get modelEnum => _modelEnum;
  set modelEnum(String modelEnum) => _modelEnum = modelEnum;
  
  String get modelDisplayName => _modelDisplayName;
  set modelDisplayName(String modelDisplayName) => _modelDisplayName = modelDisplayName;
  
  String get modelMappingKey => _modelMappingKey;
  set modelMappingKey(String modelMappingKey) => _modelMappingKey = modelMappingKey;

  String get modelYearEnum => _modelYearEnum;
  set modelYearEnum(String modelYearEnum) => _modelYearEnum = modelYearEnum;

  String get modelYearDisplayName => _modelYearDisplayName;
  set modelYearDisplayName(String modelYearDisplayName) => _modelYearDisplayName = modelYearDisplayName;

  String get modelYearMappingKey => _modelYearMappingKey;
  set modelYearMappingKey(String modelYearMappingKey) => _modelYearMappingKey = modelYearMappingKey;

  String get trimEnum => _trimEnum;
  set trimEnum(String trimEnum) => _trimEnum = trimEnum;
  
  String get trimDisplayName => _trimDisplayName;
  set trimDisplayName(String trimDisplayName) => _trimDisplayName = trimDisplayName;
  
  String get trimMappingKey => _trimMappingKey;
  set trimMappingKey(String trimMappingKey) => _trimMappingKey = trimMappingKey;
  
  String get variantEnum => _variantEnum;
  set variantEnum(String variantEnum) => _variantEnum = variantEnum;
  
  String get variantDisplayName => _variantDisplayName;
  set variantDisplayName(String variantDisplayName) => _variantDisplayName = variantDisplayName;
  
  String get variantLongDisplayName => _variantLongDisplayName;
  set variantLongDisplayName(String variantLongDisplayName) => _variantLongDisplayName = variantLongDisplayName;

  String get variantMappingKey => _variantMappingKey;
  set variantMappingKey(String variantMappingKey) => _variantMappingKey = variantMappingKey;
  
  int get modelDisplayOrder => _modelDisplayOrder;
  set modelDisplayOrder(int modelDisplayOrder) => _modelDisplayOrder = modelDisplayOrder;
  
  int get trimDisplayOrder => _trimDisplayOrder;
  set trimDisplayOrder(int trimDisplayOrder) => _trimDisplayOrder = trimDisplayOrder;
  
  int get variantDisplayOrder => _variantDisplayOrder;
  set variantDisplayOrder(int variantDisplayOrder) => _variantDisplayOrder = variantDisplayOrder;
  
  List<FscDependencies> get fscDependencies => _fscDependencies;
  set fscDependencies(List<FscDependencies> fscDependencies) => _fscDependencies = fscDependencies;
  
  bool get isActive => _isActive;
  set isActive(bool isActive) => _isActive = isActive;

  Products.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _languageCodeEnum = json['languageCodeEnum'];
    _modelEnum = json['modelEnum'];
    _modelDisplayName = json['modelDisplayName'];
    _modelMappingKey = json['modelMappingKey'];
    _modelYearEnum = json['modelYearEnum'];
    _modelYearDisplayName = json['modelYearDisplayName'];
    _modelYearMappingKey = json['modelYearMappingKey'];
    _trimEnum = json['trimEnum'];
    _trimDisplayName = json['trimDisplayName'];
    _trimMappingKey = json['trimMappingKey'];
    _variantEnum = json['variantEnum'];
    _variantDisplayName = json['variantDisplayName'];
    _variantLongDisplayName = json['variantLongDisplayName'];
    _variantMappingKey = json['variantMappingKey'];
    _modelDisplayOrder = json['modelDisplayOrder'];
    _trimDisplayOrder = json['trimDisplayOrder'];
    _variantDisplayOrder = json['variantDisplayOrder'];
    if (json['fscDependencies'] != null) {
      _fscDependencies = new List<FscDependencies>();
      json['fscDependencies'].forEach((v) {
        _fscDependencies.add(new FscDependencies.fromJson(v));
      });
    }
    _isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['languageCodeEnum'] = this._languageCodeEnum;
    data['modelEnum'] = this._modelEnum;
    data['modelDisplayName'] = this._modelDisplayName;
    data['modelMappingKey'] = this._modelMappingKey;
    data['modelYearEnum'] = this._modelYearEnum;
    data['modelYearDisplayName'] = this._modelYearDisplayName;
    data['modelYearMappingKey'] = this._modelYearMappingKey;
    data['trimEnum'] = this._trimEnum;
    data['trimDisplayName'] = this._trimDisplayName;
    data['trimMappingKey'] = this._trimMappingKey;
    data['variantEnum'] = this._variantEnum;
    data['variantDisplayName'] = this._variantDisplayName;
    data['variantLongDisplayName'] = this._variantLongDisplayName;
    data['variantMappingKey'] = this._variantMappingKey;
    data['modelDisplayOrder'] = this._modelDisplayOrder;
    data['trimDisplayOrder'] = this._trimDisplayOrder;
    data['variantDisplayOrder'] = this._variantDisplayOrder;
    if (this._fscDependencies != null) {
      data['fscDependencies'] = this._fscDependencies.map((v) => v.toJson()).toList();
    }
    data['isActive'] = this._isActive;
    return data;
  }
}
