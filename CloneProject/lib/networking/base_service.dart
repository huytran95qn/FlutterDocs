
// inside project
import 'package:flutter/cupertino.dart';

import 'module.dart';

class BaseService<T> extends BaseAPIService<T> implements APIService<T> {
  @override
  Future save({@required String url,@required T payload}) {
    return super.post(url, payload);
  }

  @override
  Future search({@required String url,@required T payload}) {
    return super.post(url, payload);
  }

  @override
  Future getURL({@required String url}) {
    return super.get(url);
  }
}