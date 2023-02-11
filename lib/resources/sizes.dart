class SizeArea {
  final double height;
  final double width;

  SizeArea.square({required this.width}) : height = width;

  SizeArea({required this.width, required this.height});
}

class Sizes {
  static final bankImageSize = SizeArea(width: 80, height: 50);
  static final dropdownImageSize = SizeArea.square(width: 25);
  static final currencyItemImageSize = SizeArea.square(width: 32);
  static final tableCellHeaderImageSize = SizeArea.square(width: 25);
  static final buttonSize = SizeArea(width: 220, height: 48);
}
