import 'package:compare_vehicle/model/module.dart';

class FscDependencies {
  String _fsc;
  String _fscMappingKey;
  int _msrp;
  List<AccessoryItems> _accessoryItems;
  List<SpecOptions> _specOptions;
  List<ColorCombinations> _colorCombinations;
  List<Specs> _specs;
  List<PriceItems> _priceItems;

  FscDependencies({
      String fsc,
      String fscMappingKey,
      int msrp,
      List<AccessoryItems> accessoryItems,
      List<SpecOptions> specOptions,
      List<ColorCombinations> colorCombinations,
      List<Specs> specs,
      List<PriceItems> priceItems
  }) {
    this._fsc = fsc;
    this._fscMappingKey = fscMappingKey;
    this._msrp = msrp;
    this._accessoryItems = accessoryItems;
    this._specOptions = specOptions;
    this._colorCombinations = colorCombinations;
    this._specs = specs;
    this._priceItems = priceItems;
  }

  String get fsc => _fsc;
  set fsc(String fsc) => _fsc = fsc;
  
  String get fscMappingKey => _fscMappingKey;
  set fscMappingKey(String fscMappingKey) => _fscMappingKey = fscMappingKey;
  
  int get msrp => _msrp;
  set msrp(int msrp) => _msrp = msrp;
  
  List<AccessoryItems> get accessoryItems => _accessoryItems;
  set accessoryItems(List<AccessoryItems> accessoryItems) => _accessoryItems = accessoryItems;
  
  List<SpecOptions> get specOptions => _specOptions;
  set specOptions(List<SpecOptions> specOptions) => _specOptions = specOptions;
  
  List<ColorCombinations> get colorCombinations => _colorCombinations;
  set colorCombinations(List<ColorCombinations> colorCombinations) => _colorCombinations = colorCombinations;
  
  List<Specs> get specs => _specs;
  set specs(List<Specs> specs) => _specs = specs;

  List<PriceItems> get priceItems => _priceItems;
  set priceItems(List<PriceItems> priceItems) => _priceItems = priceItems;

  FscDependencies.fromJson(Map<String, dynamic> json) {
    _fsc = json['fsc'];
    _fscMappingKey = json['fscMappingKey'];
    _msrp = json['msrp'];
    if (json['accessoryItems'] != null) {
      _accessoryItems = new List<AccessoryItems>();
      json['accessoryItems'].forEach((v) {
        _accessoryItems.add(new AccessoryItems.fromJson(v));
      });
    }
    if (json['specOptions'] != null) {
      _specOptions = new List<SpecOptions>();
      json['specOptions'].forEach((v) {
        _specOptions.add(new SpecOptions.fromJson(v));
      });
    }
    if (json['colorCombinations'] != null) {
      _colorCombinations = new List<ColorCombinations>();
      json['colorCombinations'].forEach((v) {
        _colorCombinations.add(new ColorCombinations.fromJson(v));
      });
    }
    if (json['specs'] != null) {
      _specs = new List<Specs>();
      json['specs'].forEach((v) {
        _specs.add(new Specs.fromJson(v));
      });
    }
    if (json['priceItems'] != null) {
      _priceItems = new List<PriceItems>();
      json['priceItems'].forEach((v) {
        _priceItems.add(new PriceItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fsc'] = this._fsc;
    data['fscMappingKey'] = this._fscMappingKey;
    data['msrp'] = this._msrp;
    if (this._accessoryItems != null) {
      data['accessoryItems'] =
          this._accessoryItems.map((v) => v.toJson()).toList();
    }
    if (this._specOptions != null) {
      data['specOptions'] = this._specOptions.map((v) => v.toJson()).toList();
    }
    if (this._colorCombinations != null) {
      data['colorCombinations'] =
          this._colorCombinations.map((v) => v.toJson()).toList();
    }
    if (this._specs != null) {
      data['specs'] = this._specs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}