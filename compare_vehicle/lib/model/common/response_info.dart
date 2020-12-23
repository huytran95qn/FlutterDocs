import 'package:compare_vehicle/model/module.dart';

class ResponseInfo {
  Result _result;
  String _targetUrl;
  bool _success;
  dynamic _error;
  bool _unAuthorizedRequest;
  bool _bAbp;

  ResponseInfo({
      Result result,
      String targetUrl,
      bool success,
      String error,
      bool unAuthorizedRequest,
      bool bAbp
    }) {
    this._result = result;
    this._targetUrl = targetUrl;
    this._success = success;
    this._error = error;
    this._unAuthorizedRequest = unAuthorizedRequest;
    this._bAbp = bAbp;
  }

  Result get result => _result;
  set result(Result result) => _result = result;

  String get targetUrl => _targetUrl;
  set targetUrl(String targetUrl) => _targetUrl = targetUrl;

  bool get success => _success;
  set success(bool success) => _success = success;

  dynamic get error => _error;
  set error(dynamic error) => _error = error;

  bool get unAuthorizedRequest => _unAuthorizedRequest;
  set unAuthorizedRequest(bool unAuthorizedRequest) => _unAuthorizedRequest = unAuthorizedRequest;

  bool get bAbp => _bAbp;
  set bAbp(bool bAbp) => _bAbp = bAbp;

  ResponseInfo.fromJson(Map<String, dynamic> json) {
    _result = json['result'] != null ? new Result.fromJson(json['result']) : null;
    _targetUrl = json['targetUrl'];
    _success = json['success'];
    _error = json['error'];
    _unAuthorizedRequest = json['unAuthorizedRequest'];
    _bAbp = json['__abp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._result != null) {
      data['result'] = this._result.toJson();
    }
    data['targetUrl'] = this._targetUrl;
    data['success'] = this._success;
    data['error'] = this._error;
    data['unAuthorizedRequest'] = this._unAuthorizedRequest;
    data['__abp'] = this._bAbp;
    return data;
  }
}