import 'dart:convert';

import 'package:compare_vehicle/mock_data/product_all.dart';
import 'package:compare_vehicle/model/module.dart';
import 'package:flutter/material.dart';

class ApiService extends ChangeNotifier {
  ApiService._();

  List<Products> getAllProduct() {
    final Map json = jsonDecode(MockProductAll.result);
    ResponseInfo responseInfo = ResponseInfo.fromJson(json);
    return responseInfo.result.products;
  }
}