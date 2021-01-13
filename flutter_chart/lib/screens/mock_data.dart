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
    data.add(ColorData('Red', 0));
    data.add(ColorData('Yellow', randomValue()));
    data.add(ColorData('Green', randomValue()));
  }

  List<PopularColorData> mockDate() {
    List<PopularColorData> list = [];
    for (var i = 0; i < 10; i++) {
      list.add(PopularColorData(color: 'Index $i'));
    }
    return list;
  }

  int randomValue() {
    Random random = new Random();
    return 20 + random.nextInt(30);
  }
}