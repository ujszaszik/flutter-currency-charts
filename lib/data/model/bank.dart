import 'package:currency_charts/extension/enum_extensions.dart';
import 'package:currency_charts/features/home/model/selector_item_model.dart';

enum Bank implements Comparable<Bank> {
  CIB("CIB Bank"),
  COMMERZ("Commerzbank"),
  ERSTE("Erste Bank"),
  GRANIT("Gránit Bank"),
  KDB("KDB Bank"),
  KH("K&H Bank"),
  MAGNET("Magnet Bank"),
  MFB("MFB"),
  MKB("MKB"),
  NHB("NHB"),
  OBERBANK("Oberbank"),
  OTP("OTP Bank"),
  RAIFFEISEN("Raiffeisen Bank"),
  UNICREDIT("UniCredit Bank");

  const Bank(this.name);

  final String name;

  @override
  int compareTo(Bank other) {
    return name.compareTo(other.name);
  }
}

extension BankImageName on Bank {
  String imageName() {
    return 'assets/images/bank/${shortName().toLowerCase()}.webp';
  }
}

extension BankToMenuitem on Bank {
  SelectorItemModel toMenuItem() {
    return SelectorItemModel(index: index, name: name, imageName: imageName());
  }
}
