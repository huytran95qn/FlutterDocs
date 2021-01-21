import 'package:flutter_service/networking/api_service.dart';
import 'package:flutter_service/networking/base_api_service.dart';

class BaseService<T> extends BaseAPIService<T> implements APIService<T> {
  @override
  Future save({String url, T payload}) {
    return super.post(url, payload);
  }

  @override
  Future search({String url, T payload}) {
    return super.post(url, payload);
  }

  @override
  Future getURL({String url}) {
    return super.get(url);
  }
}