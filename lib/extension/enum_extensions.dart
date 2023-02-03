extension ShortName on Enum {
  String shortName() {
    return toString().split('.').last.toLowerCase();
  }
}

extension EnumImage on Enum {
  String imageName() {
    return 'assets/${shortName().toLowerCase()}.png';
  }
}

extension EnumByIndex<T extends Enum> on Iterable<T> {
  T byIndex(int index) {
    return firstWhere((element) => element.index == index);
  }
}
