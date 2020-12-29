import 'package:compare_vehicle/model/module.dart';

class ColorCombinations {
  String _colorCombinationId;
  List<ColorProduct> _colors;

  ColorCombinations({String colorCombinationId, List<ColorProduct> colors}) {
    this._colorCombinationId = colorCombinationId;
    this._colors = colors;
  }

  String get colorCombinationId => _colorCombinationId;
  set colorCombinationId(String colorCombinationId) =>
      _colorCombinationId = colorCombinationId;
  List<ColorProduct> get colors => _colors;
  set colors(List<ColorProduct> colors) => _colors = colors;

  ColorCombinations.fromJson(Map<String, dynamic> json) {
    _colorCombinationId = json['colorCombinationId'];
    if (json['colors'] != null) {
      _colors = new List<ColorProduct>();
      json['colors'].forEach((v) {
        _colors.add(new ColorProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['colorCombinationId'] = this._colorCombinationId;
    if (this._colors != null) {
      data['colors'] = this._colors.map((v) => v.toJson()).toList();
    }
    return data;
  }
}