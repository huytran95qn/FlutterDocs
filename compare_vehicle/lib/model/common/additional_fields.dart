class AdditionalFields {
  String _additionalFieldName;
  String _additionalFieldValue;

  AdditionalFields({String additionalFieldName, String additionalFieldValue}) {
    this._additionalFieldName = additionalFieldName;
    this._additionalFieldValue = additionalFieldValue;
  }

  String get additionalFieldName => _additionalFieldName;
  set additionalFieldName(String additionalFieldName) => _additionalFieldName = additionalFieldName;
  
  String get additionalFieldValue => _additionalFieldValue;
  set additionalFieldValue(String additionalFieldValue) => _additionalFieldValue = additionalFieldValue;

  AdditionalFields.fromJson(Map<String, dynamic> json) {
    _additionalFieldName = json['additionalFieldName'];
    _additionalFieldValue = json['additionalFieldValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['additionalFieldName'] = this._additionalFieldName;
    data['additionalFieldValue'] = this._additionalFieldValue;
    return data;
  }
}
