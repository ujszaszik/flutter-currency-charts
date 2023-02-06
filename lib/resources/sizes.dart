class SizeArea {
  final double height;
  final double width;

  SizeArea.square({required this.width}) : height = width;

  SizeArea({required this.width, required this.height});
}

class Sizes {
  static final bankImageSize = SizeArea(width: 50, height: 150);
  static final currencyDropdownImageSize = SizeArea.square(width: 25);
  static final currencyItemImageSize = SizeArea.square(width: 32);
  static final tableCellHeaderImageSize = SizeArea.square(width: 25);
}
