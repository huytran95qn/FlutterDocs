import 'package:compare_vehicle/model/module.dart';

class ColorCombinations {
  String _colorCombinationId;
  List<Colors> _colors;

  ColorCombinations({String colorCombinationId, List<Colors> colors}) {
    this._colorCombinationId = colorCombinationId;
    this._colors = colors;
  }

  String get colorCombinationId => _colorCombinationId;
  set colorCombinationId(String colorCombinationId) =>
      _colorCombinationId = colorCombinationId;
  List<Colors> get colors => _colors;
  set colors(List<Colors> colors) => _colors = colors;

  ColorCombinations.fromJson(Map<String, dynamic> json) {
    _colorCombinationId = json['colorCombinationId'];
    if (json['colors'] != null) {
      _colors = new List<Colors>();
      json['colors'].forEach((v) {
        _colors.add(new Colors.fromJson(v));
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