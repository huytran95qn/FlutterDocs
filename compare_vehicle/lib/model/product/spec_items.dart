import 'package:compare_vehicle/model/module.dart';

class SpecItems {
  String _id;
  String _specCode;
  String _specTitle;
  String _specDescription;
  List<AdditionalFields> _additionalFields;

  SpecItems({
      String id,
      String specCode,
      String specTitle,
      String specDescription,
      List<AdditionalFields> additionalFields
  }) {
    this._id = id;
    this._specCode = specCode;
    this._specTitle = specTitle;
    this._specDescription = specDescription;
    this._additionalFields = additionalFields;
  }

  String get id => _id;
  set id(String id) => _id = id;
  
  String get specCode => _specCode;
  set specCode(String specCode) => _specCode = specCode;
  
  String get specTitle => _specTitle;
  set specTitle(String specTitle) => _specTitle = specTitle;
  
  String get specDescription => _specDescription;
  set specDescription(String specDescription) => _specDescription = specDescription;
  
  List<AdditionalFields> get additionalFields => _additionalFields;
  set additionalFields(List<AdditionalFields> additionalFields) => _additionalFields = additionalFields;

  SpecItems.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _specCode = json['specCode'];
    _specTitle = json['specTitle'];
    _specDescription = json['specDescription'];
    if (json['additionalFields'] != null) {
      _additionalFields = new List<AdditionalFields>();
      json['additionalFields'].forEach((v) {
        _additionalFields.add(new AdditionalFields.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['specCode'] = this._specCode;
    data['specTitle'] = this._specTitle;
    data['specDescription'] = this._specDescription;
    if (this._additionalFields != null) {
      data['additionalFields'] = this._additionalFields.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
