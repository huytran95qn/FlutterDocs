import 'dart:convert';
import 'dart:io';

import 'package:flutter_service/networking/fetch_data_exception.dart';
import 'package:flutter_service/networking/interceptor/module.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';


class BaseAPIService<T> {
  final Client _client = HttpClientWithInterceptor.build(
    interceptors: [
      HeaderInterceptor(),
      LoggingInterceptor()
    ],
    requestTimeout: Duration(minutes: 1)
  );


  Future<dynamic> get(String url) async {
    print('------- Api GET -------');
    print('URL: $url');
    dynamic responseJson;
    try {
      final Response _response = await _client.get(url);
      responseJson = _returnResponse(_response);
    } catch (e) {
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!');
    print('------- End Api GET -------');
    return responseJson;
  }

  Future<dynamic> post(String url, T payload) async {
    print('------- Api POST -------');
    print('URL: $url');
    dynamic responseJson;
    try {
      final _body = payload != null ? jsonEncode(payload) : null;
      final http.Response _response = await _client.post(url, body: _body);
      responseJson = _returnResponse(_response);
    } catch (e) {
      throw FetchDataException('No Internet connection');
    }
    print('api post recieved!');
    print('------- End Api POST -------');
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case HttpStatus.ok:
        final _json = json.decode(response.body.toString());
        print(_json);
        return _json;
      case HttpStatus.badRequest:
        throw BadRequestException(response.body.toString());

      case HttpStatus.unauthorized:
      case HttpStatus.forbidden:
        throw UnauthorisedException(response.body.toString());

      case HttpStatus.internalServerError:
      default:
        throw FetchDataException('Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}