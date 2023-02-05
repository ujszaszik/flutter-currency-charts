import 'package:currency_charts/extension/enum_extensions.dart';
import 'package:currency_charts/features/home/model/selector_item_model.dart';

enum CurrencyType implements Comparable<CurrencyType> {
  AUD('Ausztrál dollár'),
  BGN('Bolgár leva'),
  CAD('Kanadai dollár'),
  CHF('Svájci frank'),
  CZK('Cseh korona'),
  DKK('Dán korona'),
  EUR('Euró'),
  GBP('Angol font'),
  HRK('Horvát kuna'),
  JPY('Japán jen'),
  NOK('Norvég korona'),
  PLN('Lengyel zloty'),
  RON('Román lej'),
  RSD('Szerb dínár'),
  RUB('Orosz rubel'),
  SEK('Svéd korona'),
  TRY('Török líra'),
  UAH('Ukrán hrivnya'),
  USD('USA dollár');

  const CurrencyType(this.name);

  final String name;

  @override
  int compareTo(CurrencyType other) {
    return shortName().compareTo(other.shortName());
  }
}

extension CurrencyTypeImageName on CurrencyType {
  String imageName() {
    return 'assets/images/currency/${shortName().toLowerCase()}.webp';
  }
}

extension UnitToMenuitem on CurrencyType {
  SelectorItemModel toMenuItem() {
    return SelectorItemModel(index: index, name: name, imageName: imageName());
  }
}
