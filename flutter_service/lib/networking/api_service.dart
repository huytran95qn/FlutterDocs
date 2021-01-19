import 'package:flutter/material.dart';

abstract class APIService<T> {
  Future save({@required String url, @required T payload}) {}

  Future search({@required String url, T payload}) {}

  Future findOne({@required String url, T payload}) {}
}
