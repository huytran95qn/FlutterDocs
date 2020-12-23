import 'package:compare_vehicle/model/module.dart';

class Result {
  List<Products> _products;

  Result({List<Products> products}) {
    this._products = products;
  }

  List<Products> get products => _products;
  set products(List<Products> products) => _products = products;

  Result.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      _products = new List<Products>();
      json['products'].forEach((v) {
        _products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._products != null) {
      data['products'] = this._products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}