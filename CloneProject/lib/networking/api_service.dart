import 'package:flutter/material.dart';

abstract class APIService<T> {
  Future getURL({@required String url}) {}

  Future save({@required String url, @required T payload}) {}

  Future search({@required String url, T payload}) {}
}
