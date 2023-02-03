import 'package:currency_charts/extension/enum_extensions.dart';
import 'package:currency_charts/features/home/model/selector_item_model.dart';

enum Bank {
  CIB("CIB Bank"),
  COMMERZ("Commerzbank"),
  ERSTE("Erste Bank"),
  GRANIT("Gránit Bank"),
  KH("K&H Bank"),
  KDB("KDB Bank"),
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
}

extension BankToMenuitem on Bank {
  SelectorItemModel toMenuItem() {
    return SelectorItemModel(index: index, name: name, imageName: imageName());
  }
}
