typedef ChartsItems = List<ChartsData>;

class ChartsData {
  final String date;
  final double value;

  ChartsData({required this.date, required this.value});

  @override
  String toString() {
    return 'ChartsData{date: $date, value: $value}';
  }
}
