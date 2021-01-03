import 'dart:math';

class ColorData {
  String name;
  int percentage;
  ColorData(String name, int percentage) {
    this.name = name;
    this.percentage = percentage;
  }
}

class PopularColorData {
  final String color;
  List<ColorData> data = [];
  PopularColorData({this.color}) {
    data.add(ColorData('Red', randomValue()));
    data.add(ColorData('Yellow', randomValue()));
    data.add(ColorData('Green', randomValue()));
  }

  List<PopularColorData> mockDate() {
    List<PopularColorData> list = [];
    list.add(PopularColorData(color: 'VietNam'));
    list.add(PopularColorData(color: 'US'));
    list.add(PopularColorData(color: 'UK'));
    list.add(PopularColorData(color: 'Italya'));
    list.add(PopularColorData(color: 'Japan'));
    return list;
  }

  int randomValue() {
    Random random = new Random();
    return 20 + random.nextInt(30);
  }
}