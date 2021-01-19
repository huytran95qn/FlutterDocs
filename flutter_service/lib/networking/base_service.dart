import 'dart:convert';
import 'dart:io';
import 'package:flutter_service/models/api_response/api_response_model.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_service/interceptor/module.dart';
import 'package:flutter_service/networking/api_service.dart';

class BaseService<T> implements APIService<T> {
  final http.Client _client = HttpClientWithInterceptor.build(
    interceptors: [
      HeaderInterceptor(),
      LoggingInterceptor()
    ],
    requestTimeout: Duration(minutes: 1)
  );

  @override
  Future findOne({String url, T payload}) {
    // TODO: implement findOne
    throw UnimplementedError();
  }

  @override
  Future save({String url, T payload}) {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Future search({String url, T payload}) {
    // TODO: implement search
    throw UnimplementedError();
  }

  dynamic _postRequest({String url, T payload}) async {
    var _apiResponseResult;
    try {
      final _body = payload != null ? jsonEncode(payload) : null;
      final http.Response response = await _client.post(url, body: _body);
      _apiResponseResult = _parseResponse(response);
    } on SocketException {
      
      // throw FetchDataException('No Internet connection');
    }

    return _apiResponseResult;
  }

  dynamic _parseResponse(http.Response response) {
    APIResponse _apiResponse = APIResponse.fromJson(json.decode(response.body));
    switch (response.statusCode) {
      case HttpStatus.ok:
        return _apiResponse.result;
      
      default:

    };
  }

}