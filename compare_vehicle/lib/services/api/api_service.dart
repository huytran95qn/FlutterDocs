import 'dart:convert';

import 'package:compare_vehicle/mock_data/product_all.dart';
import 'package:compare_vehicle/model/module.dart';
import 'package:flutter/material.dart';

class ApiService extends ChangeNotifier {
  static ApiService _sInstance;

  ApiService._();

  factory ApiService.shared() {
    if (_sInstance == null) {
      _sInstance = ApiService._();
    }
    return _sInstance;
  }

  List<Products> getAllProduct() {
    final Map json = jsonDecode(MockProductAll.result);
    ResponseInfo responseInfo = ResponseInfo.fromJson(json);
    return responseInfo.result.products;
  }

  List<ModelGroups> sortProductByModelEnum() {
    final products = this.getAllProduct();
    List<ModelGroups> models = [];
    for (int i = 0; i < products.length; i++) {
      final product = products[i];
      if(models.length > 0) {
        final findModel = models.where((model) => model.modelEnum == product.modelEnum);
        if(findModel.isNotEmpty) {
          findModel.single.products.add(product);
          continue;
        }
      }

      models.add(new ModelGroups(product: product));
    }
    models.sort((a,b) => a.modelDisplayName.compareTo(b.modelDisplayName));

    return models;
  }
}